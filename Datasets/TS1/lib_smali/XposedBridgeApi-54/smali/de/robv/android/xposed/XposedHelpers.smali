.class public Lde/robv/android/xposed/XposedHelpers;
.super Ljava/lang/Object;
.source "XposedHelpers.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/robv/android/xposed/XposedHelpers$ClassNotFoundError;,
        Lde/robv/android/xposed/XposedHelpers$InvocationTargetError;
    }
.end annotation


# static fields
.field private static final additionalFields:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Ljava/lang/Object;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final constructorCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Constructor",
            "<*>;>;"
        }
    .end annotation
.end field

.field private static final fieldCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Field;",
            ">;"
        }
    .end annotation
.end field

.field private static final methodCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Method;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 26
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lde/robv/android/xposed/XposedHelpers;->fieldCache:Ljava/util/HashMap;

    .line 27
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lde/robv/android/xposed/XposedHelpers;->methodCache:Ljava/util/HashMap;

    .line 28
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lde/robv/android/xposed/XposedHelpers;->constructorCache:Ljava/util/HashMap;

    .line 29
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lde/robv/android/xposed/XposedHelpers;->additionalFields:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static assetAsByteArray(Landroid/content/res/Resources;Ljava/lang/String;)[B
    .registers 7
    .param p0, "res"    # Landroid/content/res/Resources;
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1146
    invoke-virtual {p0}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    invoke-virtual {v4, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 1148
    .local v1, "is":Ljava/io/InputStream;
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1149
    .local v0, "buf":Ljava/io/ByteArrayOutputStream;
    const/16 v4, 0x400

    new-array v3, v4, [B

    .line 1152
    .local v3, "temp":[B
    :goto_11
    invoke-virtual {v1, v3}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .local v2, "read":I
    if-gtz v2, :cond_1f

    .line 1155
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 1156
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    return-object v4

    .line 1153
    :cond_1f
    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_11
.end method

.method public static varargs callMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "parameterTypes"    # [Ljava/lang/Class;
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 967
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p1, p2, p3}, Lde/robv/android/xposed/XposedHelpers;->findMethodBestMatch(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/reflect/Method;

    move-result-object v1

    invoke-virtual {v1, p0, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_b
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_b} :catch_d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_b} :catch_1b
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_b} :catch_1d

    move-result-object v1

    return-object v1

    .line 968
    :catch_d
    move-exception v0

    .line 970
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 971
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 972
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1b
    move-exception v0

    .line 973
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0

    .line 974
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_1d
    move-exception v0

    .line 975
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v1, Lde/robv/android/xposed/XposedHelpers$InvocationTargetError;

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-direct {v1, v2}, Lde/robv/android/xposed/XposedHelpers$InvocationTargetError;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static varargs callMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 947
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p1, p2}, Lde/robv/android/xposed/XposedHelpers;->findMethodBestMatch(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/reflect/Method;

    move-result-object v1

    invoke-virtual {v1, p0, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_b
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_b} :catch_d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_b} :catch_1b
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_b} :catch_1d

    move-result-object v1

    return-object v1

    .line 948
    :catch_d
    move-exception v0

    .line 950
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 951
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 952
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1b
    move-exception v0

    .line 953
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0

    .line 954
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_1d
    move-exception v0

    .line 955
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v1, Lde/robv/android/xposed/XposedHelpers$InvocationTargetError;

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-direct {v1, v2}, Lde/robv/android/xposed/XposedHelpers$InvocationTargetError;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static varargs callStaticMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "parameterTypes"    # [Ljava/lang/Class;
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 1005
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1, p2, p3}, Lde/robv/android/xposed/XposedHelpers;->findMethodBestMatch(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/reflect/Method;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_8} :catch_a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_8} :catch_18
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_8} :catch_1a

    move-result-object v1

    return-object v1

    .line 1006
    :catch_a
    move-exception v0

    .line 1008
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 1009
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1010
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_18
    move-exception v0

    .line 1011
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0

    .line 1012
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_1a
    move-exception v0

    .line 1013
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v1, Lde/robv/android/xposed/XposedHelpers$InvocationTargetError;

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-direct {v1, v2}, Lde/robv/android/xposed/XposedHelpers$InvocationTargetError;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static varargs callStaticMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 985
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1, p2}, Lde/robv/android/xposed/XposedHelpers;->findMethodBestMatch(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/reflect/Method;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_8} :catch_a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_8} :catch_18
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_8} :catch_1a

    move-result-object v1

    return-object v1

    .line 986
    :catch_a
    move-exception v0

    .line 988
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 989
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 990
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_18
    move-exception v0

    .line 991
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0

    .line 992
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_1a
    move-exception v0

    .line 993
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v1, Lde/robv/android/xposed/XposedHelpers$InvocationTargetError;

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-direct {v1, v2}, Lde/robv/android/xposed/XposedHelpers$InvocationTargetError;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static varargs findAndHookConstructor(Ljava/lang/Class;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;
    .registers 6
    .param p1, "parameterTypesAndCallback"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/Object;",
            ")",
            "Lde/robv/android/xposed/XC_MethodHook$Unhook;"
        }
    .end annotation

    .prologue
    .line 414
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    array-length v2, p1

    if-eqz v2, :cond_c

    array-length v2, p1

    add-int/lit8 v2, v2, -0x1

    aget-object v2, p1, v2

    instance-of v2, v2, Lde/robv/android/xposed/XC_MethodHook;

    if-nez v2, :cond_14

    .line 415
    :cond_c
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "no callback defined"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 417
    :cond_14
    array-length v2, p1

    add-int/lit8 v2, v2, -0x1

    aget-object v0, p1, v2

    check-cast v0, Lde/robv/android/xposed/XC_MethodHook;

    .line 418
    .local v0, "callback":Lde/robv/android/xposed/XC_MethodHook;
    invoke-virtual {p0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-static {v2, p1}, Lde/robv/android/xposed/XposedHelpers;->getParameterClasses(Ljava/lang/ClassLoader;[Ljava/lang/Object;)[Ljava/lang/Class;

    move-result-object v2

    invoke-static {p0, v2}, Lde/robv/android/xposed/XposedHelpers;->findConstructorExact(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 420
    .local v1, "m":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    invoke-static {v1, v0}, Lde/robv/android/xposed/XposedBridge;->hookMethod(Ljava/lang/reflect/Member;Lde/robv/android/xposed/XC_MethodHook;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    move-result-object v2

    return-object v2
.end method

.method public static varargs findAndHookConstructor(Ljava/lang/String;Ljava/lang/ClassLoader;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;
    .registers 4
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;
    .param p2, "parameterTypesAndCallback"    # [Ljava/lang/Object;

    .prologue
    .line 425
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedHelpers;->findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0, p2}, Lde/robv/android/xposed/XposedHelpers;->findAndHookConstructor(Ljava/lang/Class;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    move-result-object v0

    return-object v0
.end method

.method public static varargs findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;
    .registers 7
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "parameterTypesAndCallback"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Lde/robv/android/xposed/XC_MethodHook$Unhook;"
        }
    .end annotation

    .prologue
    .line 125
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    array-length v2, p2

    if-eqz v2, :cond_c

    array-length v2, p2

    add-int/lit8 v2, v2, -0x1

    aget-object v2, p2, v2

    instance-of v2, v2, Lde/robv/android/xposed/XC_MethodHook;

    if-nez v2, :cond_14

    .line 126
    :cond_c
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "no callback defined"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 128
    :cond_14
    array-length v2, p2

    add-int/lit8 v2, v2, -0x1

    aget-object v0, p2, v2

    check-cast v0, Lde/robv/android/xposed/XC_MethodHook;

    .line 129
    .local v0, "callback":Lde/robv/android/xposed/XC_MethodHook;
    invoke-virtual {p0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-static {v2, p2}, Lde/robv/android/xposed/XposedHelpers;->getParameterClasses(Ljava/lang/ClassLoader;[Ljava/lang/Object;)[Ljava/lang/Class;

    move-result-object v2

    invoke-static {p0, p1, v2}, Lde/robv/android/xposed/XposedHelpers;->findMethodExact(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 131
    .local v1, "m":Ljava/lang/reflect/Method;
    invoke-static {v1, v0}, Lde/robv/android/xposed/XposedBridge;->hookMethod(Ljava/lang/reflect/Member;Lde/robv/android/xposed/XC_MethodHook;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    move-result-object v2

    return-object v2
.end method

.method public static varargs findAndHookMethod(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;
    .registers 5
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "parameterTypesAndCallback"    # [Ljava/lang/Object;

    .prologue
    .line 136
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedHelpers;->findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0, p2, p3}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    move-result-object v0

    return-object v0
.end method

.method public static findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;
    .registers 4
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/ClassLoader;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 47
    if-nez p1, :cond_4

    .line 48
    sget-object p1, Lde/robv/android/xposed/XposedBridge;->BOOTCLASSLOADER:Ljava/lang/ClassLoader;

    .line 50
    :cond_4
    const/4 v1, 0x0

    :try_start_5
    invoke-static {p1, p0, v1}, Lexternal/org/apache/commons/lang3/ClassUtils;->getClass(Ljava/lang/ClassLoader;Ljava/lang/String;Z)Ljava/lang/Class;
    :try_end_8
    .catch Ljava/lang/ClassNotFoundException; {:try_start_5 .. :try_end_8} :catch_a

    move-result-object v1

    return-object v1

    .line 51
    :catch_a
    move-exception v0

    .line 52
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v1, Lde/robv/android/xposed/XposedHelpers$ClassNotFoundError;

    invoke-direct {v1, v0}, Lde/robv/android/xposed/XposedHelpers$ClassNotFoundError;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static varargs findConstructorBestMatch(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    .registers 13
    .param p1, "parameterTypes"    # [Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Constructor",
            "<*>;"
        }
    .end annotation

    .prologue
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v10, 0x1

    .line 429
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 430
    .local v5, "sb":Ljava/lang/StringBuilder;
    invoke-static {p1}, Lde/robv/android/xposed/XposedHelpers;->getParametersString([Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 431
    const-string v6, "#bestmatch"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 432
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 434
    .local v4, "fullConstructorName":Ljava/lang/String;
    sget-object v6, Lde/robv/android/xposed/XposedHelpers;->constructorCache:Ljava/util/HashMap;

    invoke-virtual {v6, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_32

    .line 435
    sget-object v6, Lde/robv/android/xposed/XposedHelpers;->constructorCache:Ljava/util/HashMap;

    invoke-virtual {v6, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Constructor;

    .line 436
    .local v1, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    if-nez v1, :cond_3b

    .line 437
    new-instance v6, Ljava/lang/NoSuchMethodError;

    invoke-direct {v6, v4}, Ljava/lang/NoSuchMethodError;-><init>(Ljava/lang/String;)V

    throw v6

    .line 442
    .end local v1    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :cond_32
    :try_start_32
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedHelpers;->findConstructorExact(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 443
    .restart local v1    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    sget-object v6, Lde/robv/android/xposed/XposedHelpers;->constructorCache:Ljava/util/HashMap;

    invoke-virtual {v6, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3b
    .catch Ljava/lang/NoSuchMethodError; {:try_start_32 .. :try_end_3b} :catch_3c

    .line 465
    .end local v1    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :cond_3b
    :goto_3b
    return-object v1

    .line 445
    :catch_3c
    move-exception v6

    .line 447
    const/4 v0, 0x0

    .line 448
    .local v0, "bestMatch":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v2

    .line 449
    .local v2, "constructors":[Ljava/lang/reflect/Constructor;
    array-length v7, v2

    const/4 v6, 0x0

    :goto_44
    if-lt v6, v7, :cond_52

    .line 462
    if-eqz v0, :cond_72

    .line 463
    invoke-virtual {v0, v10}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 464
    sget-object v6, Lde/robv/android/xposed/XposedHelpers;->constructorCache:Ljava/util/HashMap;

    invoke-virtual {v6, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v1, v0

    .line 465
    goto :goto_3b

    .line 449
    :cond_52
    aget-object v1, v2, v6

    .line 451
    .restart local v1    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    invoke-virtual {v1}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v8

    invoke-static {p1, v8, v10}, Lexternal/org/apache/commons/lang3/ClassUtils;->isAssignable([Ljava/lang/Class;[Ljava/lang/Class;Z)Z

    move-result v8

    if-eqz v8, :cond_6f

    .line 453
    if-eqz v0, :cond_6e

    .line 454
    invoke-virtual {v1}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v8

    .line 455
    invoke-virtual {v0}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v9

    .line 453
    invoke-static {v8, v9, p1}, Lexternal/org/apache/commons/lang3/reflect/MemberUtils;->compareParameterTypes([Ljava/lang/Class;[Ljava/lang/Class;[Ljava/lang/Class;)I

    move-result v8

    if-gez v8, :cond_6f

    .line 457
    :cond_6e
    move-object v0, v1

    .line 449
    :cond_6f
    add-int/lit8 v6, v6, 0x1

    goto :goto_44

    .line 467
    .end local v1    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :cond_72
    new-instance v3, Ljava/lang/NoSuchMethodError;

    invoke-direct {v3, v4}, Ljava/lang/NoSuchMethodError;-><init>(Ljava/lang/String;)V

    .line 468
    .local v3, "e":Ljava/lang/NoSuchMethodError;
    sget-object v6, Lde/robv/android/xposed/XposedHelpers;->constructorCache:Ljava/util/HashMap;

    const/4 v7, 0x0

    invoke-virtual {v6, v4, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 469
    throw v3
.end method

.method public static findConstructorBestMatch(Ljava/lang/Class;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/reflect/Constructor;
    .registers 6
    .param p1, "parameterTypes"    # [Ljava/lang/Class;
    .param p2, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/reflect/Constructor",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 478
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    .line 479
    .local v0, "argsClasses":[Ljava/lang/Class;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    array-length v2, p1

    if-lt v1, v2, :cond_a

    .line 486
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedHelpers;->findConstructorBestMatch(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    return-object v2

    .line 480
    :cond_a
    aget-object v2, p1, v1

    if-eqz v2, :cond_11

    .line 479
    :goto_e
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 482
    :cond_11
    if-nez v0, :cond_17

    .line 483
    invoke-static {p2}, Lde/robv/android/xposed/XposedHelpers;->getParameterTypes([Ljava/lang/Object;)[Ljava/lang/Class;

    move-result-object v0

    .line 484
    :cond_17
    aget-object v2, v0, v1

    aput-object v2, p1, v1

    goto :goto_e
.end method

.method public static varargs findConstructorBestMatch(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/reflect/Constructor;
    .registers 3
    .param p1, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/reflect/Constructor",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 474
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p1}, Lde/robv/android/xposed/XposedHelpers;->getParameterTypes([Ljava/lang/Object;)[Ljava/lang/Class;

    move-result-object v0

    invoke-static {p0, v0}, Lde/robv/android/xposed/XposedHelpers;->findConstructorBestMatch(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    return-object v0
.end method

.method public static varargs findConstructorExact(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    .registers 9
    .param p1, "parameterTypes"    # [Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Constructor",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 386
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 387
    .local v4, "sb":Ljava/lang/StringBuilder;
    invoke-static {p1}, Lde/robv/android/xposed/XposedHelpers;->getParametersString([Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 388
    const-string v5, "#exact"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 389
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 391
    .local v3, "fullConstructorName":Ljava/lang/String;
    sget-object v5, Lde/robv/android/xposed/XposedHelpers;->constructorCache:Ljava/util/HashMap;

    invoke-virtual {v5, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_33

    .line 392
    sget-object v5, Lde/robv/android/xposed/XposedHelpers;->constructorCache:Ljava/util/HashMap;

    invoke-virtual {v5, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Constructor;

    .line 393
    .local v0, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    if-nez v0, :cond_31

    .line 394
    new-instance v5, Ljava/lang/NoSuchMethodError;

    invoke-direct {v5, v3}, Ljava/lang/NoSuchMethodError;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_31
    move-object v1, v0

    .line 402
    .end local v0    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .local v1, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :goto_32
    return-object v1

    .line 399
    .end local v1    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :cond_33
    :try_start_33
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 400
    .restart local v0    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    const/4 v5, 0x1

    invoke-virtual {v0, v5}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 401
    sget-object v5, Lde/robv/android/xposed/XposedHelpers;->constructorCache:Ljava/util/HashMap;

    invoke-virtual {v5, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_40
    .catch Ljava/lang/NoSuchMethodException; {:try_start_33 .. :try_end_40} :catch_42

    move-object v1, v0

    .line 402
    .end local v0    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .restart local v1    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    goto :goto_32

    .line 403
    .end local v1    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :catch_42
    move-exception v2

    .line 404
    .local v2, "e":Ljava/lang/NoSuchMethodException;
    sget-object v5, Lde/robv/android/xposed/XposedHelpers;->constructorCache:Ljava/util/HashMap;

    const/4 v6, 0x0

    invoke-virtual {v5, v3, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 405
    new-instance v5, Ljava/lang/NoSuchMethodError;

    invoke-direct {v5, v3}, Ljava/lang/NoSuchMethodError;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method public static varargs findConstructorExact(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/reflect/Constructor;
    .registers 3
    .param p1, "parameterTypes"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/reflect/Constructor",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 378
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-static {v0, p1}, Lde/robv/android/xposed/XposedHelpers;->getParameterClasses(Ljava/lang/ClassLoader;[Ljava/lang/Object;)[Ljava/lang/Class;

    move-result-object v0

    invoke-static {p0, v0}, Lde/robv/android/xposed/XposedHelpers;->findConstructorExact(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    return-object v0
.end method

.method public static varargs findConstructorExact(Ljava/lang/String;Ljava/lang/ClassLoader;[Ljava/lang/Object;)Ljava/lang/reflect/Constructor;
    .registers 5
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;
    .param p2, "parameterTypes"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/ClassLoader;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/reflect/Constructor",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 382
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedHelpers;->findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    invoke-static {p1, p2}, Lde/robv/android/xposed/XposedHelpers;->getParameterClasses(Ljava/lang/ClassLoader;[Ljava/lang/Object;)[Ljava/lang/Class;

    move-result-object v1

    invoke-static {v0, v1}, Lde/robv/android/xposed/XposedHelpers;->findConstructorExact(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    return-object v0
.end method

.method public static findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .registers 9
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .prologue
    .line 61
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .local v4, "sb":Ljava/lang/StringBuilder;
    const/16 v5, 0x23

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 63
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 66
    .local v3, "fullFieldName":Ljava/lang/String;
    sget-object v5, Lde/robv/android/xposed/XposedHelpers;->fieldCache:Ljava/util/HashMap;

    invoke-virtual {v5, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2f

    .line 67
    sget-object v5, Lde/robv/android/xposed/XposedHelpers;->fieldCache:Ljava/util/HashMap;

    invoke-virtual {v5, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Field;

    .line 68
    .local v1, "field":Ljava/lang/reflect/Field;
    if-nez v1, :cond_2d

    .line 69
    new-instance v5, Ljava/lang/NoSuchFieldError;

    invoke-direct {v5, v3}, Ljava/lang/NoSuchFieldError;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_2d
    move-object v2, v1

    .line 77
    .end local v1    # "field":Ljava/lang/reflect/Field;
    .local v2, "field":Ljava/lang/reflect/Field;
    :goto_2e
    return-object v2

    .line 74
    .end local v2    # "field":Ljava/lang/reflect/Field;
    :cond_2f
    :try_start_2f
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedHelpers;->findFieldRecursiveImpl(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 75
    .restart local v1    # "field":Ljava/lang/reflect/Field;
    const/4 v5, 0x1

    invoke-virtual {v1, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 76
    sget-object v5, Lde/robv/android/xposed/XposedHelpers;->fieldCache:Ljava/util/HashMap;

    invoke-virtual {v5, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3c
    .catch Ljava/lang/NoSuchFieldException; {:try_start_2f .. :try_end_3c} :catch_3e

    move-object v2, v1

    .line 77
    .end local v1    # "field":Ljava/lang/reflect/Field;
    .restart local v2    # "field":Ljava/lang/reflect/Field;
    goto :goto_2e

    .line 78
    .end local v2    # "field":Ljava/lang/reflect/Field;
    :catch_3e
    move-exception v0

    .line 79
    .local v0, "e":Ljava/lang/NoSuchFieldException;
    sget-object v5, Lde/robv/android/xposed/XposedHelpers;->fieldCache:Ljava/util/HashMap;

    const/4 v6, 0x0

    invoke-virtual {v5, v3, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    new-instance v5, Ljava/lang/NoSuchFieldError;

    invoke-direct {v5, v3}, Ljava/lang/NoSuchFieldError;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method private static findFieldRecursiveImpl(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .registers 4
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchFieldException;
        }
    .end annotation

    .prologue
    .line 86
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    :try_end_3
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    .line 94
    :goto_4
    return-object v1

    .line 87
    :catch_5
    move-exception v0

    .line 89
    .local v0, "e":Ljava/lang/NoSuchFieldException;
    :goto_6
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p0

    .line 90
    if-eqz p0, :cond_14

    const-class v1, Ljava/lang/Object;

    invoke-virtual {p0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 97
    :cond_14
    throw v0

    .line 94
    :cond_15
    :try_start_15
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    :try_end_18
    .catch Ljava/lang/NoSuchFieldException; {:try_start_15 .. :try_end_18} :catch_1a

    move-result-object v1

    goto :goto_4

    .line 95
    :catch_1a
    move-exception v1

    goto :goto_6
.end method

.method public static findFirstFieldByExactType(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/reflect/Field;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .prologue
    .line 107
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object v0, p0

    .line 109
    .local v0, "clz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v3

    array-length v4, v3

    const/4 v2, 0x0

    :goto_7
    if-lt v2, v4, :cond_36

    .line 115
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    if-nez v0, :cond_1

    .line 117
    new-instance v2, Ljava/lang/NoSuchFieldError;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Field of type "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " in class "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/NoSuchFieldError;-><init>(Ljava/lang/String;)V

    throw v2

    .line 109
    :cond_36
    aget-object v1, v3, v2

    .line 110
    .local v1, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v5

    if-ne v5, p1, :cond_43

    .line 111
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 112
    return-object v1

    .line 109
    :cond_43
    add-int/lit8 v2, v2, 0x1

    goto :goto_7
.end method

.method public static varargs findMethodBestMatch(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 16
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "parameterTypes"    # [Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .prologue
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v12, 0x1

    .line 223
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 224
    .local v6, "sb":Ljava/lang/StringBuilder;
    const/16 v7, 0x23

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 225
    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    invoke-static {p2}, Lde/robv/android/xposed/XposedHelpers;->getParametersString([Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 227
    const-string v7, "#bestmatch"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 230
    .local v4, "fullMethodName":Ljava/lang/String;
    sget-object v7, Lde/robv/android/xposed/XposedHelpers;->methodCache:Ljava/util/HashMap;

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3a

    .line 231
    sget-object v7, Lde/robv/android/xposed/XposedHelpers;->methodCache:Ljava/util/HashMap;

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/reflect/Method;

    .line 232
    .local v5, "method":Ljava/lang/reflect/Method;
    if-nez v5, :cond_43

    .line 233
    new-instance v7, Ljava/lang/NoSuchMethodError;

    invoke-direct {v7, v4}, Ljava/lang/NoSuchMethodError;-><init>(Ljava/lang/String;)V

    throw v7

    .line 238
    .end local v5    # "method":Ljava/lang/reflect/Method;
    :cond_3a
    :try_start_3a
    invoke-static {p0, p1, p2}, Lde/robv/android/xposed/XposedHelpers;->findMethodExact(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 239
    .restart local v5    # "method":Ljava/lang/reflect/Method;
    sget-object v7, Lde/robv/android/xposed/XposedHelpers;->methodCache:Ljava/util/HashMap;

    invoke-virtual {v7, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_43
    .catch Ljava/lang/NoSuchMethodError; {:try_start_3a .. :try_end_43} :catch_44

    .line 269
    .end local v5    # "method":Ljava/lang/reflect/Method;
    :cond_43
    :goto_43
    return-object v5

    .line 241
    :catch_44
    move-exception v7

    .line 243
    const/4 v0, 0x0

    .line 244
    .local v0, "bestMatch":Ljava/lang/reflect/Method;
    move-object v1, p0

    .line 245
    .local v1, "clz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v2, 0x1

    .line 247
    .local v2, "considerPrivateMethods":Z
    :cond_48
    invoke-virtual {v1}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v8

    array-length v9, v8

    const/4 v7, 0x0

    :goto_4e
    if-lt v7, v9, :cond_63

    .line 263
    const/4 v2, 0x0

    .line 264
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    if-nez v1, :cond_48

    .line 266
    if-eqz v0, :cond_9a

    .line 267
    invoke-virtual {v0, v12}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 268
    sget-object v7, Lde/robv/android/xposed/XposedHelpers;->methodCache:Ljava/util/HashMap;

    invoke-virtual {v7, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v5, v0

    .line 269
    goto :goto_43

    .line 247
    :cond_63
    aget-object v5, v8, v7

    .line 249
    .restart local v5    # "method":Ljava/lang/reflect/Method;
    if-nez v2, :cond_74

    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v10

    invoke-static {v10}, Ljava/lang/reflect/Modifier;->isPrivate(I)Z

    move-result v10

    if-eqz v10, :cond_74

    .line 247
    :cond_71
    :goto_71
    add-int/lit8 v7, v7, 0x1

    goto :goto_4e

    .line 253
    :cond_74
    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_71

    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v10

    invoke-static {p2, v10, v12}, Lexternal/org/apache/commons/lang3/ClassUtils;->isAssignable([Ljava/lang/Class;[Ljava/lang/Class;Z)Z

    move-result v10

    if-eqz v10, :cond_71

    .line 255
    if-eqz v0, :cond_98

    .line 256
    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v10

    .line 257
    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v11

    .line 255
    invoke-static {v10, v11, p2}, Lexternal/org/apache/commons/lang3/reflect/MemberUtils;->compareParameterTypes([Ljava/lang/Class;[Ljava/lang/Class;[Ljava/lang/Class;)I

    move-result v10

    if-gez v10, :cond_71

    .line 259
    :cond_98
    move-object v0, v5

    goto :goto_71

    .line 271
    .end local v5    # "method":Ljava/lang/reflect/Method;
    :cond_9a
    new-instance v3, Ljava/lang/NoSuchMethodError;

    invoke-direct {v3, v4}, Ljava/lang/NoSuchMethodError;-><init>(Ljava/lang/String;)V

    .line 272
    .local v3, "e":Ljava/lang/NoSuchMethodError;
    sget-object v7, Lde/robv/android/xposed/XposedHelpers;->methodCache:Ljava/util/HashMap;

    const/4 v8, 0x0

    invoke-virtual {v7, v4, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    throw v3
.end method

.method public static findMethodBestMatch(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/reflect/Method;
    .registers 7
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "parameterTypes"    # [Ljava/lang/Class;
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .prologue
    .line 296
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    .line 297
    .local v0, "argsClasses":[Ljava/lang/Class;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    array-length v2, p2

    if-lt v1, v2, :cond_a

    .line 304
    invoke-static {p0, p1, p2}, Lde/robv/android/xposed/XposedHelpers;->findMethodBestMatch(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    return-object v2

    .line 298
    :cond_a
    aget-object v2, p2, v1

    if-eqz v2, :cond_11

    .line 297
    :goto_e
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 300
    :cond_11
    if-nez v0, :cond_17

    .line 301
    invoke-static {p3}, Lde/robv/android/xposed/XposedHelpers;->getParameterTypes([Ljava/lang/Object;)[Ljava/lang/Class;

    move-result-object v0

    .line 302
    :cond_17
    aget-object v2, v0, v1

    aput-object v2, p2, v1

    goto :goto_e
.end method

.method public static varargs findMethodBestMatch(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/reflect/Method;
    .registers 4
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .prologue
    .line 284
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p2}, Lde/robv/android/xposed/XposedHelpers;->getParameterTypes([Ljava/lang/Object;)[Ljava/lang/Class;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lde/robv/android/xposed/XposedHelpers;->findMethodBestMatch(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    return-object v0
.end method

.method public static varargs findMethodExact(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 10
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "parameterTypes"    # [Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .prologue
    .line 158
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 159
    .local v4, "sb":Ljava/lang/StringBuilder;
    const/16 v5, 0x23

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 160
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    invoke-static {p2}, Lde/robv/android/xposed/XposedHelpers;->getParametersString([Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    const-string v5, "#exact"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 165
    .local v1, "fullMethodName":Ljava/lang/String;
    sget-object v5, Lde/robv/android/xposed/XposedHelpers;->methodCache:Ljava/util/HashMap;

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3b

    .line 166
    sget-object v5, Lde/robv/android/xposed/XposedHelpers;->methodCache:Ljava/util/HashMap;

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/reflect/Method;

    .line 167
    .local v2, "method":Ljava/lang/reflect/Method;
    if-nez v2, :cond_39

    .line 168
    new-instance v5, Ljava/lang/NoSuchMethodError;

    invoke-direct {v5, v1}, Ljava/lang/NoSuchMethodError;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_39
    move-object v3, v2

    .line 176
    .end local v2    # "method":Ljava/lang/reflect/Method;
    .local v3, "method":Ljava/lang/reflect/Method;
    :goto_3a
    return-object v3

    .line 173
    .end local v3    # "method":Ljava/lang/reflect/Method;
    :cond_3b
    :try_start_3b
    invoke-virtual {p0, p1, p2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 174
    .restart local v2    # "method":Ljava/lang/reflect/Method;
    const/4 v5, 0x1

    invoke-virtual {v2, v5}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 175
    sget-object v5, Lde/robv/android/xposed/XposedHelpers;->methodCache:Ljava/util/HashMap;

    invoke-virtual {v5, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_48
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3b .. :try_end_48} :catch_4a

    move-object v3, v2

    .line 176
    .end local v2    # "method":Ljava/lang/reflect/Method;
    .restart local v3    # "method":Ljava/lang/reflect/Method;
    goto :goto_3a

    .line 177
    .end local v3    # "method":Ljava/lang/reflect/Method;
    :catch_4a
    move-exception v0

    .line 178
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    sget-object v5, Lde/robv/android/xposed/XposedHelpers;->methodCache:Ljava/util/HashMap;

    const/4 v6, 0x0

    invoke-virtual {v5, v1, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    new-instance v5, Ljava/lang/NoSuchMethodError;

    invoke-direct {v5, v1}, Ljava/lang/NoSuchMethodError;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method public static varargs findMethodExact(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/reflect/Method;
    .registers 4
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "parameterTypes"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .prologue
    .line 148
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-static {v0, p2}, Lde/robv/android/xposed/XposedHelpers;->getParameterClasses(Ljava/lang/ClassLoader;[Ljava/lang/Object;)[Ljava/lang/Class;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lde/robv/android/xposed/XposedHelpers;->findMethodExact(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    return-object v0
.end method

.method public static varargs findMethodExact(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/reflect/Method;
    .registers 6
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "parameterTypes"    # [Ljava/lang/Object;

    .prologue
    .line 153
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedHelpers;->findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    invoke-static {p1, p3}, Lde/robv/android/xposed/XposedHelpers;->getParameterClasses(Ljava/lang/ClassLoader;[Ljava/lang/Object;)[Ljava/lang/Class;

    move-result-object v1

    invoke-static {v0, p2, v1}, Lde/robv/android/xposed/XposedHelpers;->findMethodExact(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    return-object v0
.end method

.method public static varargs findMethodsByExactParameters(Ljava/lang/Class;Ljava/lang/Class;[Ljava/lang/Class;)[Ljava/lang/reflect/Method;
    .registers 13
    .param p2, "parameterTypes"    # [Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/Class",
            "<*>;)[",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .prologue
    .line 190
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p1, "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    .line 191
    .local v4, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Method;>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v6

    array-length v7, v6

    const/4 v5, 0x0

    :goto_b
    if-lt v5, v7, :cond_1a

    .line 213
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    new-array v5, v5, [Ljava/lang/reflect/Method;

    invoke-interface {v4, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/reflect/Method;

    return-object v5

    .line 191
    :cond_1a
    aget-object v2, v6, v5

    .line 192
    .local v2, "method":Ljava/lang/reflect/Method;
    if-eqz p1, :cond_27

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v8

    if-eq p1, v8, :cond_27

    .line 191
    :cond_24
    :goto_24
    add-int/lit8 v5, v5, 0x1

    goto :goto_b

    .line 195
    :cond_27
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v3

    .line 196
    .local v3, "methodParameterTypes":[Ljava/lang/Class;
    array-length v8, p2

    array-length v9, v3

    if-ne v8, v9, :cond_24

    .line 199
    const/4 v1, 0x1

    .line 200
    .local v1, "match":Z
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_31
    array-length v8, p2

    if-lt v0, v8, :cond_3e

    .line 207
    :goto_34
    if-eqz v1, :cond_24

    .line 210
    const/4 v8, 0x1

    invoke-virtual {v2, v8}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 211
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_24

    .line 201
    :cond_3e
    aget-object v8, p2, v0

    aget-object v9, v3, v0

    if-eq v8, v9, :cond_46

    .line 202
    const/4 v1, 0x0

    .line 203
    goto :goto_34

    .line 200
    :cond_46
    add-int/lit8 v0, v0, 0x1

    goto :goto_31
.end method

.method public static getAdditionalInstanceField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 1082
    if-nez p0, :cond_a

    .line 1083
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "object must not be null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1084
    :cond_a
    if-nez p1, :cond_14

    .line 1085
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "key must not be null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1088
    :cond_14
    sget-object v2, Lde/robv/android/xposed/XposedHelpers;->additionalFields:Ljava/util/WeakHashMap;

    monitor-enter v2

    .line 1089
    :try_start_17
    sget-object v1, Lde/robv/android/xposed/XposedHelpers;->additionalFields:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 1090
    .local v0, "objectFields":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-nez v0, :cond_24

    .line 1091
    monitor-exit v2

    const/4 v1, 0x0

    .line 1095
    :goto_23
    return-object v1

    .line 1088
    :cond_24
    monitor-exit v2
    :try_end_25
    .catchall {:try_start_17 .. :try_end_25} :catchall_2f

    .line 1094
    monitor-enter v0

    .line 1095
    :try_start_26
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    monitor-exit v0

    goto :goto_23

    .line 1094
    :catchall_2c
    move-exception v1

    monitor-exit v0
    :try_end_2e
    .catchall {:try_start_26 .. :try_end_2e} :catchall_2c

    throw v1

    .line 1088
    .end local v0    # "objectFields":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :catchall_2f
    move-exception v1

    :try_start_30
    monitor-exit v2
    :try_end_31
    .catchall {:try_start_30 .. :try_end_31} :catchall_2f

    throw v1
.end method

.method public static getAdditionalStaticField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 1134
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedHelpers;->getAdditionalInstanceField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static getAdditionalStaticField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 1122
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0, p1}, Lde/robv/android/xposed/XposedHelpers;->getAdditionalInstanceField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static getBooleanField(Ljava/lang/Object;Ljava/lang/String;)Z
    .registers 5
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 628
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z
    :try_end_b
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_b} :catch_d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_b} :catch_1b

    move-result v1

    return v1

    .line 629
    :catch_d
    move-exception v0

    .line 631
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 632
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 633
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1b
    move-exception v0

    .line 634
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static getByteField(Ljava/lang/Object;Ljava/lang/String;)B
    .registers 5
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 640
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->getByte(Ljava/lang/Object;)B
    :try_end_b
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_b} :catch_d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_b} :catch_1b

    move-result v1

    return v1

    .line 641
    :catch_d
    move-exception v0

    .line 643
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 644
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 645
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1b
    move-exception v0

    .line 646
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static getCharField(Ljava/lang/Object;Ljava/lang/String;)C
    .registers 5
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 652
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->getChar(Ljava/lang/Object;)C
    :try_end_b
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_b} :catch_d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_b} :catch_1b

    move-result v1

    return v1

    .line 653
    :catch_d
    move-exception v0

    .line 655
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 656
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 657
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1b
    move-exception v0

    .line 658
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static varargs getClassesAsArray([Ljava/lang/Class;)[Ljava/lang/Class;
    .registers 1
    .param p0, "clazzes"    # [Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class",
            "<*>;)[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 355
    return-object p0
.end method

.method public static getDoubleField(Ljava/lang/Object;Ljava/lang/String;)D
    .registers 5
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 664
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->getDouble(Ljava/lang/Object;)D
    :try_end_b
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_b} :catch_d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_b} :catch_1b

    move-result-wide v1

    return-wide v1

    .line 665
    :catch_d
    move-exception v0

    .line 667
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 668
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 669
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1b
    move-exception v0

    .line 670
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static getFloatField(Ljava/lang/Object;Ljava/lang/String;)F
    .registers 5
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 676
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F
    :try_end_b
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_b} :catch_d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_b} :catch_1b

    move-result v1

    return v1

    .line 677
    :catch_d
    move-exception v0

    .line 679
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 680
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 681
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1b
    move-exception v0

    .line 682
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static getIntField(Ljava/lang/Object;Ljava/lang/String;)I
    .registers 5
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 688
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I
    :try_end_b
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_b} :catch_d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_b} :catch_1b

    move-result v1

    return v1

    .line 689
    :catch_d
    move-exception v0

    .line 691
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 692
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 693
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1b
    move-exception v0

    .line 694
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static getLongField(Ljava/lang/Object;Ljava/lang/String;)J
    .registers 5
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 700
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J
    :try_end_b
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_b} :catch_d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_b} :catch_1b

    move-result-wide v1

    return-wide v1

    .line 701
    :catch_d
    move-exception v0

    .line 703
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 704
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 705
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1b
    move-exception v0

    .line 706
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static getMD5Sum(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p0, "file"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1164
    :try_start_0
    const-string v7, "MD5"

    invoke-static {v7}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    .line 1165
    .local v2, "digest":Ljava/security/MessageDigest;
    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 1166
    .local v4, "is":Ljava/io/InputStream;
    const/16 v7, 0x2000

    new-array v1, v7, [B

    .line 1167
    .local v1, "buffer":[B
    const/4 v6, 0x0

    .line 1168
    .local v6, "read":I
    :goto_10
    invoke-virtual {v4, v1}, Ljava/io/InputStream;->read([B)I

    move-result v6

    if-gtz v6, :cond_2a

    .line 1171
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 1172
    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v5

    .line 1173
    .local v5, "md5sum":[B
    new-instance v0, Ljava/math/BigInteger;

    const/4 v7, 0x1

    invoke-direct {v0, v7, v5}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 1174
    .local v0, "bigInt":Ljava/math/BigInteger;
    const/16 v7, 0x10

    invoke-virtual {v0, v7}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;

    move-result-object v7

    .line 1176
    .end local v0    # "bigInt":Ljava/math/BigInteger;
    .end local v1    # "buffer":[B
    .end local v2    # "digest":Ljava/security/MessageDigest;
    .end local v4    # "is":Ljava/io/InputStream;
    .end local v5    # "md5sum":[B
    .end local v6    # "read":I
    :goto_29
    return-object v7

    .line 1169
    .restart local v1    # "buffer":[B
    .restart local v2    # "digest":Ljava/security/MessageDigest;
    .restart local v4    # "is":Ljava/io/InputStream;
    .restart local v6    # "read":I
    :cond_2a
    const/4 v7, 0x0

    invoke-virtual {v2, v1, v7, v6}, Ljava/security/MessageDigest;->update([BII)V
    :try_end_2e
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_2e} :catch_2f

    goto :goto_10

    .line 1175
    .end local v1    # "buffer":[B
    .end local v2    # "digest":Ljava/security/MessageDigest;
    .end local v4    # "is":Ljava/io/InputStream;
    .end local v6    # "read":I
    :catch_2f
    move-exception v3

    .line 1176
    .local v3, "e":Ljava/security/NoSuchAlgorithmException;
    const-string v7, ""

    goto :goto_29
.end method

.method public static getObjectField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 611
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_b
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_b} :catch_d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_b} :catch_1b

    move-result-object v1

    return-object v1

    .line 612
    :catch_d
    move-exception v0

    .line 614
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 615
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 616
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1b
    move-exception v0

    .line 617
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method private static getParameterClasses(Ljava/lang/ClassLoader;[Ljava/lang/Object;)[Ljava/lang/Class;
    .registers 8
    .param p0, "classLoader"    # Ljava/lang/ClassLoader;
    .param p1, "parameterTypesAndCallback"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ClassLoader;",
            "[",
            "Ljava/lang/Object;",
            ")[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 323
    const/4 v1, 0x0

    .line 324
    .local v1, "parameterClasses":[Ljava/lang/Class;
    array-length v3, p1

    add-int/lit8 v0, v3, -0x1

    .local v0, "i":I
    :goto_5
    if-gez v0, :cond_d

    .line 345
    if-nez v1, :cond_c

    .line 346
    const/4 v3, 0x0

    new-array v1, v3, [Ljava/lang/Class;

    .line 348
    :cond_c
    return-object v1

    .line 325
    :cond_d
    aget-object v2, p1, v0

    .line 326
    .local v2, "type":Ljava/lang/Object;
    if-nez v2, :cond_19

    .line 327
    new-instance v3, Lde/robv/android/xposed/XposedHelpers$ClassNotFoundError;

    const-string v4, "parameter type must not be null"

    invoke-direct {v3, v4, v5}, Lde/robv/android/xposed/XposedHelpers$ClassNotFoundError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 330
    :cond_19
    instance-of v3, v2, Lde/robv/android/xposed/XC_MethodHook;

    if-eqz v3, :cond_20

    .line 324
    .end local v2    # "type":Ljava/lang/Object;
    :goto_1d
    add-int/lit8 v0, v0, -0x1

    goto :goto_5

    .line 333
    .restart local v2    # "type":Ljava/lang/Object;
    :cond_20
    if-nez v1, :cond_26

    .line 334
    add-int/lit8 v3, v0, 0x1

    new-array v1, v3, [Ljava/lang/Class;

    .line 336
    :cond_26
    instance-of v3, v2, Ljava/lang/Class;

    if-eqz v3, :cond_2f

    .line 337
    check-cast v2, Ljava/lang/Class;

    .end local v2    # "type":Ljava/lang/Object;
    aput-object v2, v1, v0

    goto :goto_1d

    .line 338
    .restart local v2    # "type":Ljava/lang/Object;
    :cond_2f
    instance-of v3, v2, Ljava/lang/String;

    if-eqz v3, :cond_3c

    .line 339
    check-cast v2, Ljava/lang/String;

    .end local v2    # "type":Ljava/lang/Object;
    invoke-static {v2, p0}, Lde/robv/android/xposed/XposedHelpers;->findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v3

    aput-object v3, v1, v0

    goto :goto_1d

    .line 341
    .restart local v2    # "type":Ljava/lang/Object;
    :cond_3c
    new-instance v3, Lde/robv/android/xposed/XposedHelpers$ClassNotFoundError;

    const-string v4, "parameter type must either be specified as Class or String"

    invoke-direct {v3, v4, v5}, Lde/robv/android/xposed/XposedHelpers$ClassNotFoundError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public static varargs getParameterTypes([Ljava/lang/Object;)[Ljava/lang/Class;
    .registers 4
    .param p0, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 311
    array-length v2, p0

    new-array v0, v2, [Ljava/lang/Class;

    .line 312
    .local v0, "clazzes":[Ljava/lang/Class;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4
    array-length v2, p0

    if-lt v1, v2, :cond_8

    .line 315
    return-object v0

    .line 313
    :cond_8
    aget-object v2, p0, v1

    if-eqz v2, :cond_17

    aget-object v2, p0, v1

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    :goto_12
    aput-object v2, v0, v1

    .line 312
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 313
    :cond_17
    const/4 v2, 0x0

    goto :goto_12
.end method

.method private static varargs getParametersString([Ljava/lang/Class;)Ljava/lang/String;
    .registers 7
    .param p0, "clazzes"    # [Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 359
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "("

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 360
    .local v2, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x1

    .line 361
    .local v1, "first":Z
    array-length v4, p0

    const/4 v3, 0x0

    :goto_a
    if-lt v3, v4, :cond_16

    .line 372
    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 373
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 361
    :cond_16
    aget-object v0, p0, v3

    .line 362
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v1, :cond_27

    .line 363
    const/4 v1, 0x0

    .line 367
    :goto_1b
    if-eqz v0, :cond_2d

    .line 368
    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 361
    :goto_24
    add-int/lit8 v3, v3, 0x1

    goto :goto_a

    .line 365
    :cond_27
    const-string v5, ","

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1b

    .line 370
    :cond_2d
    const-string v5, "null"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_24
.end method

.method public static getShortField(Ljava/lang/Object;Ljava/lang/String;)S
    .registers 5
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 712
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->getShort(Ljava/lang/Object;)S
    :try_end_b
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_b} :catch_d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_b} :catch_1b

    move-result v1

    return v1

    .line 713
    :catch_d
    move-exception v0

    .line 715
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 716
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 717
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1b
    move-exception v0

    .line 718
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static getStaticBooleanField(Ljava/lang/Class;Ljava/lang/String;)Z
    .registers 5
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 846
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_8} :catch_a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_8} :catch_18

    move-result v1

    return v1

    .line 847
    :catch_a
    move-exception v0

    .line 849
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 850
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 851
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_18
    move-exception v0

    .line 852
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static getStaticByteField(Ljava/lang/Class;Ljava/lang/String;)B
    .registers 5
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")B"
        }
    .end annotation

    .prologue
    .line 858
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->getByte(Ljava/lang/Object;)B
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_8} :catch_a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_8} :catch_18

    move-result v1

    return v1

    .line 859
    :catch_a
    move-exception v0

    .line 861
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 862
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 863
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_18
    move-exception v0

    .line 864
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static getStaticCharField(Ljava/lang/Class;Ljava/lang/String;)C
    .registers 5
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")C"
        }
    .end annotation

    .prologue
    .line 870
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->getChar(Ljava/lang/Object;)C
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_8} :catch_a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_8} :catch_18

    move-result v1

    return v1

    .line 871
    :catch_a
    move-exception v0

    .line 873
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 874
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 875
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_18
    move-exception v0

    .line 876
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static getStaticDoubleField(Ljava/lang/Class;Ljava/lang/String;)D
    .registers 5
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")D"
        }
    .end annotation

    .prologue
    .line 882
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->getDouble(Ljava/lang/Object;)D
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_8} :catch_a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_8} :catch_18

    move-result-wide v1

    return-wide v1

    .line 883
    :catch_a
    move-exception v0

    .line 885
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 886
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 887
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_18
    move-exception v0

    .line 888
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static getStaticFloatField(Ljava/lang/Class;Ljava/lang/String;)F
    .registers 5
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")F"
        }
    .end annotation

    .prologue
    .line 894
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_8} :catch_a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_8} :catch_18

    move-result v1

    return v1

    .line 895
    :catch_a
    move-exception v0

    .line 897
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 898
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 899
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_18
    move-exception v0

    .line 900
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static getStaticIntField(Ljava/lang/Class;Ljava/lang/String;)I
    .registers 5
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .prologue
    .line 906
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_8} :catch_a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_8} :catch_18

    move-result v1

    return v1

    .line 907
    :catch_a
    move-exception v0

    .line 909
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 910
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 911
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_18
    move-exception v0

    .line 912
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static getStaticLongField(Ljava/lang/Class;Ljava/lang/String;)J
    .registers 5
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")J"
        }
    .end annotation

    .prologue
    .line 918
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_8} :catch_a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_8} :catch_18

    move-result-wide v1

    return-wide v1

    .line 919
    :catch_a
    move-exception v0

    .line 921
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 922
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 923
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_18
    move-exception v0

    .line 924
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static getStaticObjectField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 834
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_8} :catch_a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_8} :catch_18

    move-result-object v1

    return-object v1

    .line 835
    :catch_a
    move-exception v0

    .line 837
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 838
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 839
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_18
    move-exception v0

    .line 840
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static getStaticShortField(Ljava/lang/Class;Ljava/lang/String;)S
    .registers 5
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")S"
        }
    .end annotation

    .prologue
    .line 930
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->getShort(Ljava/lang/Object;)S
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_8} :catch_a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_8} :catch_18

    move-result v1

    return v1

    .line 931
    :catch_a
    move-exception v0

    .line 933
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 934
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 935
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_18
    move-exception v0

    .line 936
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static getSurroundingThis(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 623
    const-string v0, "this$0"

    invoke-static {p0, v0}, Lde/robv/android/xposed/XposedHelpers;->getObjectField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static varargs newInstance(Ljava/lang/Class;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "parameterTypes"    # [Ljava/lang/Class;
    .param p2, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 1046
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1, p2}, Lde/robv/android/xposed/XposedHelpers;->findConstructorBestMatch(Ljava/lang/Class;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_7
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_7} :catch_9
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_7} :catch_17
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_7} :catch_19
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_7} :catch_24

    move-result-object v1

    return-object v1

    .line 1047
    :catch_9
    move-exception v0

    .line 1049
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 1050
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1051
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_17
    move-exception v0

    .line 1052
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0

    .line 1053
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_19
    move-exception v0

    .line 1054
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v1, Lde/robv/android/xposed/XposedHelpers$InvocationTargetError;

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-direct {v1, v2}, Lde/robv/android/xposed/XposedHelpers$InvocationTargetError;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 1055
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_24
    move-exception v0

    .line 1056
    .local v0, "e":Ljava/lang/InstantiationException;
    new-instance v1, Ljava/lang/InstantiationError;

    invoke-virtual {v0}, Ljava/lang/InstantiationException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/InstantiationError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static varargs newInstance(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 1030
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedHelpers;->findConstructorBestMatch(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_7
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_7} :catch_9
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_7} :catch_17
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_7} :catch_19
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_7} :catch_24

    move-result-object v1

    return-object v1

    .line 1031
    :catch_9
    move-exception v0

    .line 1033
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 1034
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1035
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_17
    move-exception v0

    .line 1036
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0

    .line 1037
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_19
    move-exception v0

    .line 1038
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v1, Lde/robv/android/xposed/XposedHelpers$InvocationTargetError;

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-direct {v1, v2}, Lde/robv/android/xposed/XposedHelpers$InvocationTargetError;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 1039
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_24
    move-exception v0

    .line 1040
    .local v0, "e":Ljava/lang/InstantiationException;
    new-instance v1, Ljava/lang/InstantiationError;

    invoke-virtual {v0}, Ljava/lang/InstantiationException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/InstantiationError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static removeAdditionalInstanceField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 1100
    if-nez p0, :cond_a

    .line 1101
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "object must not be null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1102
    :cond_a
    if-nez p1, :cond_14

    .line 1103
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "key must not be null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1106
    :cond_14
    sget-object v2, Lde/robv/android/xposed/XposedHelpers;->additionalFields:Ljava/util/WeakHashMap;

    monitor-enter v2

    .line 1107
    :try_start_17
    sget-object v1, Lde/robv/android/xposed/XposedHelpers;->additionalFields:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 1108
    .local v0, "objectFields":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-nez v0, :cond_24

    .line 1109
    monitor-exit v2

    const/4 v1, 0x0

    .line 1113
    :goto_23
    return-object v1

    .line 1106
    :cond_24
    monitor-exit v2
    :try_end_25
    .catchall {:try_start_17 .. :try_end_25} :catchall_2f

    .line 1112
    monitor-enter v0

    .line 1113
    :try_start_26
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    monitor-exit v0

    goto :goto_23

    .line 1112
    :catchall_2c
    move-exception v1

    monitor-exit v0
    :try_end_2e
    .catchall {:try_start_26 .. :try_end_2e} :catchall_2c

    throw v1

    .line 1106
    .end local v0    # "objectFields":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :catchall_2f
    move-exception v1

    :try_start_30
    monitor-exit v2
    :try_end_31
    .catchall {:try_start_30 .. :try_end_31} :catchall_2f

    throw v1
.end method

.method public static removeAdditionalStaticField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 1138
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedHelpers;->removeAdditionalInstanceField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static removeAdditionalStaticField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 1126
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0, p1}, Lde/robv/android/xposed/XposedHelpers;->removeAdditionalInstanceField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static setAdditionalInstanceField(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 1062
    if-nez p0, :cond_a

    .line 1063
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "object must not be null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1064
    :cond_a
    if-nez p1, :cond_14

    .line 1065
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "key must not be null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1068
    :cond_14
    sget-object v2, Lde/robv/android/xposed/XposedHelpers;->additionalFields:Ljava/util/WeakHashMap;

    monitor-enter v2

    .line 1069
    :try_start_17
    sget-object v1, Lde/robv/android/xposed/XposedHelpers;->additionalFields:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 1070
    .local v0, "objectFields":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-nez v0, :cond_2b

    .line 1071
    new-instance v0, Ljava/util/HashMap;

    .end local v0    # "objectFields":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1072
    .restart local v0    # "objectFields":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    sget-object v1, Lde/robv/android/xposed/XposedHelpers;->additionalFields:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1068
    :cond_2b
    monitor-exit v2
    :try_end_2c
    .catchall {:try_start_17 .. :try_end_2c} :catchall_33

    .line 1076
    monitor-enter v0

    .line 1077
    :try_start_2d
    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    monitor-exit v0
    :try_end_32
    .catchall {:try_start_2d .. :try_end_32} :catchall_36

    return-object v1

    .line 1068
    .end local v0    # "objectFields":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :catchall_33
    move-exception v1

    :try_start_34
    monitor-exit v2
    :try_end_35
    .catchall {:try_start_34 .. :try_end_35} :catchall_33

    throw v1

    .line 1076
    .restart local v0    # "objectFields":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :catchall_36
    move-exception v1

    :try_start_37
    monitor-exit v0
    :try_end_38
    .catchall {:try_start_37 .. :try_end_38} :catchall_36

    throw v1
.end method

.method public static setAdditionalStaticField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 1130
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0, p1, p2}, Lde/robv/android/xposed/XposedHelpers;->setAdditionalInstanceField(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static setAdditionalStaticField(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 1118
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lde/robv/android/xposed/XposedHelpers;->setAdditionalInstanceField(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static setBooleanField(Ljava/lang/Object;Ljava/lang/String;Z)V
    .registers 6
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # Z

    .prologue
    .line 514
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0, p2}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V
    :try_end_b
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_b} :catch_c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_b} :catch_1a

    .line 522
    return-void

    .line 515
    :catch_c
    move-exception v0

    .line 517
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 518
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 519
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1a
    move-exception v0

    .line 520
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static setByteField(Ljava/lang/Object;Ljava/lang/String;B)V
    .registers 6
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # B

    .prologue
    .line 526
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0, p2}, Ljava/lang/reflect/Field;->setByte(Ljava/lang/Object;B)V
    :try_end_b
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_b} :catch_c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_b} :catch_1a

    .line 534
    return-void

    .line 527
    :catch_c
    move-exception v0

    .line 529
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 530
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 531
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1a
    move-exception v0

    .line 532
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static setCharField(Ljava/lang/Object;Ljava/lang/String;C)V
    .registers 6
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # C

    .prologue
    .line 538
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0, p2}, Ljava/lang/reflect/Field;->setChar(Ljava/lang/Object;C)V
    :try_end_b
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_b} :catch_c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_b} :catch_1a

    .line 546
    return-void

    .line 539
    :catch_c
    move-exception v0

    .line 541
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 542
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 543
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1a
    move-exception v0

    .line 544
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static setDoubleField(Ljava/lang/Object;Ljava/lang/String;D)V
    .registers 7
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # D

    .prologue
    .line 550
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0, p2, p3}, Ljava/lang/reflect/Field;->setDouble(Ljava/lang/Object;D)V
    :try_end_b
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_b} :catch_c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_b} :catch_1a

    .line 558
    return-void

    .line 551
    :catch_c
    move-exception v0

    .line 553
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 554
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 555
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1a
    move-exception v0

    .line 556
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static setFloatField(Ljava/lang/Object;Ljava/lang/String;F)V
    .registers 6
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # F

    .prologue
    .line 562
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0, p2}, Ljava/lang/reflect/Field;->setFloat(Ljava/lang/Object;F)V
    :try_end_b
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_b} :catch_c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_b} :catch_1a

    .line 570
    return-void

    .line 563
    :catch_c
    move-exception v0

    .line 565
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 566
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 567
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1a
    move-exception v0

    .line 568
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static setIntField(Ljava/lang/Object;Ljava/lang/String;I)V
    .registers 6
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # I

    .prologue
    .line 574
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0, p2}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V
    :try_end_b
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_b} :catch_c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_b} :catch_1a

    .line 582
    return-void

    .line 575
    :catch_c
    move-exception v0

    .line 577
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 578
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 579
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1a
    move-exception v0

    .line 580
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static setLongField(Ljava/lang/Object;Ljava/lang/String;J)V
    .registers 7
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # J

    .prologue
    .line 586
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0, p2, p3}, Ljava/lang/reflect/Field;->setLong(Ljava/lang/Object;J)V
    :try_end_b
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_b} :catch_c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_b} :catch_1a

    .line 594
    return-void

    .line 587
    :catch_c
    move-exception v0

    .line 589
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 590
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 591
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1a
    move-exception v0

    .line 592
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static setObjectField(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 6
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 502
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_b
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_b} :catch_c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_b} :catch_1a

    .line 510
    return-void

    .line 503
    :catch_c
    move-exception v0

    .line 505
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 506
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 507
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1a
    move-exception v0

    .line 508
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static setShortField(Ljava/lang/Object;Ljava/lang/String;S)V
    .registers 6
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # S

    .prologue
    .line 598
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0, p2}, Ljava/lang/reflect/Field;->setShort(Ljava/lang/Object;S)V
    :try_end_b
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_b} :catch_c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_b} :catch_1a

    .line 606
    return-void

    .line 599
    :catch_c
    move-exception v0

    .line 601
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 602
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 603
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1a
    move-exception v0

    .line 604
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static setStaticBooleanField(Ljava/lang/Class;Ljava/lang/String;Z)V
    .registers 6
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .prologue
    .line 737
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2, p2}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_8} :catch_9
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_8} :catch_17

    .line 745
    return-void

    .line 738
    :catch_9
    move-exception v0

    .line 740
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 741
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 742
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_17
    move-exception v0

    .line 743
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static setStaticByteField(Ljava/lang/Class;Ljava/lang/String;B)V
    .registers 6
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "B)V"
        }
    .end annotation

    .prologue
    .line 749
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2, p2}, Ljava/lang/reflect/Field;->setByte(Ljava/lang/Object;B)V
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_8} :catch_9
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_8} :catch_17

    .line 757
    return-void

    .line 750
    :catch_9
    move-exception v0

    .line 752
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 753
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 754
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_17
    move-exception v0

    .line 755
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static setStaticCharField(Ljava/lang/Class;Ljava/lang/String;C)V
    .registers 6
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # C
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "C)V"
        }
    .end annotation

    .prologue
    .line 761
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2, p2}, Ljava/lang/reflect/Field;->setChar(Ljava/lang/Object;C)V
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_8} :catch_9
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_8} :catch_17

    .line 769
    return-void

    .line 762
    :catch_9
    move-exception v0

    .line 764
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 765
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 766
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_17
    move-exception v0

    .line 767
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static setStaticDoubleField(Ljava/lang/Class;Ljava/lang/String;D)V
    .registers 7
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "D)V"
        }
    .end annotation

    .prologue
    .line 773
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2, p2, p3}, Ljava/lang/reflect/Field;->setDouble(Ljava/lang/Object;D)V
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_8} :catch_9
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_8} :catch_17

    .line 781
    return-void

    .line 774
    :catch_9
    move-exception v0

    .line 776
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 777
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 778
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_17
    move-exception v0

    .line 779
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static setStaticFloatField(Ljava/lang/Class;Ljava/lang/String;F)V
    .registers 6
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "F)V"
        }
    .end annotation

    .prologue
    .line 785
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2, p2}, Ljava/lang/reflect/Field;->setFloat(Ljava/lang/Object;F)V
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_8} :catch_9
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_8} :catch_17

    .line 793
    return-void

    .line 786
    :catch_9
    move-exception v0

    .line 788
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 789
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 790
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_17
    move-exception v0

    .line 791
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static setStaticIntField(Ljava/lang/Class;Ljava/lang/String;I)V
    .registers 6
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 797
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2, p2}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_8} :catch_9
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_8} :catch_17

    .line 805
    return-void

    .line 798
    :catch_9
    move-exception v0

    .line 800
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 801
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 802
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_17
    move-exception v0

    .line 803
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static setStaticLongField(Ljava/lang/Class;Ljava/lang/String;J)V
    .registers 7
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "J)V"
        }
    .end annotation

    .prologue
    .line 809
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2, p2, p3}, Ljava/lang/reflect/Field;->setLong(Ljava/lang/Object;J)V
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_8} :catch_9
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_8} :catch_17

    .line 817
    return-void

    .line 810
    :catch_9
    move-exception v0

    .line 812
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 813
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 814
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_17
    move-exception v0

    .line 815
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static setStaticObjectField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 6
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .prologue
    .line 725
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_8} :catch_9
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_8} :catch_17

    .line 733
    return-void

    .line 726
    :catch_9
    move-exception v0

    .line 728
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 729
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 730
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_17
    move-exception v0

    .line 731
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method

.method public static setStaticShortField(Ljava/lang/Class;Ljava/lang/String;S)V
    .registers 6
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # S
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "S)V"
        }
    .end annotation

    .prologue
    .line 821
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2, p2}, Ljava/lang/reflect/Field;->setShort(Ljava/lang/Object;S)V
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_8} :catch_9
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_8} :catch_17

    .line 829
    return-void

    .line 822
    :catch_9
    move-exception v0

    .line 824
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 825
    new-instance v1, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 826
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_17
    move-exception v0

    .line 827
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    throw v0
.end method
