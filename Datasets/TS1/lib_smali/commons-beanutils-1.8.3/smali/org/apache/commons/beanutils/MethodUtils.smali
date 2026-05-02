.class public Lorg/apache/commons/beanutils/MethodUtils;
.super Ljava/lang/Object;
.source "MethodUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;
    }
.end annotation


# static fields
.field private static CACHE_METHODS:Z

.field private static final EMPTY_CLASS_PARAMETERS:[Ljava/lang/Class;

.field private static final EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

.field private static final cache:Ljava/util/Map;

.field static class$java$lang$Boolean:Ljava/lang/Class;

.field static class$java$lang$Byte:Ljava/lang/Class;

.field static class$java$lang$Character:Ljava/lang/Class;

.field static class$java$lang$Double:Ljava/lang/Class;

.field static class$java$lang$Float:Ljava/lang/Class;

.field static class$java$lang$Integer:Ljava/lang/Class;

.field static class$java$lang$Long:Ljava/lang/Class;

.field static class$java$lang$Short:Ljava/lang/Class;

.field static class$org$apache$commons$beanutils$MethodUtils:Ljava/lang/Class;

.field private static loggedAccessibleWarning:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x0

    .line 73
    sput-boolean v1, Lorg/apache/commons/beanutils/MethodUtils;->loggedAccessibleWarning:Z

    .line 83
    const/4 v0, 0x1

    sput-boolean v0, Lorg/apache/commons/beanutils/MethodUtils;->CACHE_METHODS:Z

    .line 86
    new-array v0, v1, [Ljava/lang/Class;

    sput-object v0, Lorg/apache/commons/beanutils/MethodUtils;->EMPTY_CLASS_PARAMETERS:[Ljava/lang/Class;

    .line 88
    new-array v0, v1, [Ljava/lang/Object;

    sput-object v0, Lorg/apache/commons/beanutils/MethodUtils;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    .line 110
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/MethodUtils;->cache:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1300
    return-void
.end method

.method static access$000()[Ljava/lang/Class;
    .registers 1

    .prologue
    .line 58
    sget-object v0, Lorg/apache/commons/beanutils/MethodUtils;->EMPTY_CLASS_PARAMETERS:[Ljava/lang/Class;

    return-object v0
.end method

.method private static cacheMethod(Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;Ljava/lang/reflect/Method;)V
    .registers 4
    .param p0, "md"    # Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;
    .param p1, "method"    # Ljava/lang/reflect/Method;

    .prologue
    .line 1290
    sget-boolean v0, Lorg/apache/commons/beanutils/MethodUtils;->CACHE_METHODS:Z

    if-eqz v0, :cond_10

    .line 1291
    if-eqz p1, :cond_10

    .line 1292
    sget-object v0, Lorg/apache/commons/beanutils/MethodUtils;->cache:Ljava/util/Map;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1295
    :cond_10
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 942
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static declared-synchronized clearCache()I
    .registers 3

    .prologue
    .line 135
    const-class v2, Lorg/apache/commons/beanutils/MethodUtils;

    monitor-enter v2

    :try_start_3
    sget-object v1, Lorg/apache/commons/beanutils/MethodUtils;->cache:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v0

    .line 136
    .local v0, "size":I
    sget-object v1, Lorg/apache/commons/beanutils/MethodUtils;->cache:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_10

    .line 137
    monitor-exit v2

    return v0

    .line 135
    :catchall_10
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static getAccessibleMethod(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 5
    .param p0, "clazz"    # Ljava/lang/Class;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "parameterType"    # Ljava/lang/Class;

    .prologue
    .line 699
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/Class;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    .line 700
    .local v0, "parameterTypes":[Ljava/lang/Class;
    invoke-static {p0, p1, v0}, Lorg/apache/commons/beanutils/MethodUtils;->getAccessibleMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    return-object v1
.end method

.method public static getAccessibleMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 7
    .param p0, "clazz"    # Ljava/lang/Class;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "parameterTypes"    # [Ljava/lang/Class;

    .prologue
    .line 723
    :try_start_0
    new-instance v1, Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;

    const/4 v3, 0x1

    invoke-direct {v1, p0, p1, p2, v3}, Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;-><init>(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Z)V

    .line 725
    .local v1, "md":Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;
    invoke-static {v1}, Lorg/apache/commons/beanutils/MethodUtils;->getCachedMethod(Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 726
    .local v2, "method":Ljava/lang/reflect/Method;
    if-eqz v2, :cond_d

    .line 735
    .end local v1    # "md":Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;
    .end local v2    # "method":Ljava/lang/reflect/Method;
    :goto_c
    return-object v2

    .line 730
    .restart local v1    # "md":Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;
    .restart local v2    # "method":Ljava/lang/reflect/Method;
    :cond_d
    invoke-virtual {p0, p1, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    invoke-static {p0, v3}, Lorg/apache/commons/beanutils/MethodUtils;->getAccessibleMethod(Ljava/lang/Class;Ljava/lang/reflect/Method;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 732
    invoke-static {v1, v2}, Lorg/apache/commons/beanutils/MethodUtils;->cacheMethod(Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;Ljava/lang/reflect/Method;)V
    :try_end_18
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_18} :catch_19

    goto :goto_c

    .line 734
    .end local v1    # "md":Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;
    .end local v2    # "method":Ljava/lang/reflect/Method;
    :catch_19
    move-exception v0

    .line 735
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    const/4 v2, 0x0

    goto :goto_c
.end method

.method public static getAccessibleMethod(Ljava/lang/Class;Ljava/lang/reflect/Method;)Ljava/lang/reflect/Method;
    .registers 8
    .param p0, "clazz"    # Ljava/lang/Class;
    .param p1, "method"    # Ljava/lang/reflect/Method;

    .prologue
    const/4 v3, 0x0

    .line 775
    if-nez p1, :cond_4

    .line 819
    :cond_3
    :goto_3
    return-object v3

    .line 780
    :cond_4
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v4

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 784
    const/4 v2, 0x1

    .line 785
    .local v2, "sameClass":Z
    if-nez p0, :cond_34

    .line 786
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object p0

    .line 796
    :cond_15
    invoke-virtual {p0}, Ljava/lang/Class;->getModifiers()I

    move-result v3

    invoke-static {v3}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v3

    if-eqz v3, :cond_6f

    .line 797
    if-nez v2, :cond_32

    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getModifiers()I

    move-result v3

    invoke-static {v3}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v3

    if-nez v3, :cond_32

    .line 798
    invoke-static {p1}, Lorg/apache/commons/beanutils/MethodUtils;->setMethodAccessible(Ljava/lang/reflect/Method;)V

    :cond_32
    move-object v3, p1

    .line 800
    goto :goto_3

    .line 788
    :cond_34
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 789
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_15

    .line 790
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " is not assignable from "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 803
    :cond_6f
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    .line 804
    .local v0, "methodName":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v1

    .line 807
    .local v1, "parameterTypes":[Ljava/lang/Class;
    invoke-static {p0, v0, v1}, Lorg/apache/commons/beanutils/MethodUtils;->getAccessibleMethodFromInterfaceNest(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    .line 813
    if-nez p1, :cond_81

    .line 814
    invoke-static {p0, v0, v1}, Lorg/apache/commons/beanutils/MethodUtils;->getAccessibleMethodFromSuperclass(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    :cond_81
    move-object v3, p1

    .line 819
    goto :goto_3
.end method

.method public static getAccessibleMethod(Ljava/lang/reflect/Method;)Ljava/lang/reflect/Method;
    .registers 2
    .param p0, "method"    # Ljava/lang/reflect/Method;

    .prologue
    .line 752
    if-nez p0, :cond_4

    .line 753
    const/4 v0, 0x0

    .line 756
    :goto_3
    return-object v0

    :cond_4
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0, p0}, Lorg/apache/commons/beanutils/MethodUtils;->getAccessibleMethod(Ljava/lang/Class;Ljava/lang/reflect/Method;)Ljava/lang/reflect/Method;

    move-result-object v0

    goto :goto_3
.end method

.method private static getAccessibleMethodFromInterfaceNest(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 7
    .param p0, "clazz"    # Ljava/lang/Class;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "parameterTypes"    # [Ljava/lang/Class;

    .prologue
    .line 869
    const/4 v2, 0x0

    .line 872
    .local v2, "method":Ljava/lang/reflect/Method;
    :goto_1
    if-eqz p0, :cond_33

    .line 875
    invoke-virtual {p0}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v1

    .line 876
    .local v1, "interfaces":[Ljava/lang/Class;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    array-length v3, v1

    if-ge v0, v3, :cond_2e

    .line 879
    aget-object v3, v1, v0

    invoke-virtual {v3}, Ljava/lang/Class;->getModifiers()I

    move-result v3

    invoke-static {v3}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v3

    if-nez v3, :cond_1a

    .line 876
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 885
    :cond_1a
    :try_start_1a
    aget-object v3, v1, v0

    invoke-virtual {v3, p1, p2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_1f
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1a .. :try_end_1f} :catch_35

    move-result-object v2

    .line 892
    :goto_20
    if-eqz v2, :cond_24

    move-object v3, v2

    .line 910
    .end local v0    # "i":I
    .end local v1    # "interfaces":[Ljava/lang/Class;
    :goto_23
    return-object v3

    .line 897
    .restart local v0    # "i":I
    .restart local v1    # "interfaces":[Ljava/lang/Class;
    :cond_24
    aget-object v3, v1, v0

    invoke-static {v3, p1, p2}, Lorg/apache/commons/beanutils/MethodUtils;->getAccessibleMethodFromInterfaceNest(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 901
    if-eqz v2, :cond_17

    move-object v3, v2

    .line 902
    goto :goto_23

    .line 872
    :cond_2e
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p0

    goto :goto_1

    .line 910
    .end local v0    # "i":I
    .end local v1    # "interfaces":[Ljava/lang/Class;
    :cond_33
    const/4 v3, 0x0

    goto :goto_23

    .line 887
    .restart local v0    # "i":I
    .restart local v1    # "interfaces":[Ljava/lang/Class;
    :catch_35
    move-exception v3

    goto :goto_20
.end method

.method private static getAccessibleMethodFromSuperclass(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 7
    .param p0, "clazz"    # Ljava/lang/Class;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "parameterTypes"    # [Ljava/lang/Class;

    .prologue
    const/4 v2, 0x0

    .line 838
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    .line 839
    .local v1, "parentClazz":Ljava/lang/Class;
    :goto_5
    if-eqz v1, :cond_15

    .line 840
    invoke-virtual {v1}, Ljava/lang/Class;->getModifiers()I

    move-result v3

    invoke-static {v3}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v3

    if-eqz v3, :cond_18

    .line 842
    :try_start_11
    invoke-virtual {v1, p1, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_14
    .catch Ljava/lang/NoSuchMethodException; {:try_start_11 .. :try_end_14} :catch_16

    move-result-object v2

    .line 849
    :cond_15
    :goto_15
    return-object v2

    .line 843
    :catch_16
    move-exception v0

    .line 844
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    goto :goto_15

    .line 847
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :cond_18
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    goto :goto_5
.end method

.method private static getCachedMethod(Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;)Ljava/lang/reflect/Method;
    .registers 3
    .param p0, "md"    # Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;

    .prologue
    .line 1274
    sget-boolean v1, Lorg/apache/commons/beanutils/MethodUtils;->CACHE_METHODS:Z

    if-eqz v1, :cond_15

    .line 1275
    sget-object v1, Lorg/apache/commons/beanutils/MethodUtils;->cache:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/Reference;

    .line 1276
    .local v0, "methodRef":Ljava/lang/ref/Reference;
    if-eqz v0, :cond_15

    .line 1277
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Method;

    .line 1280
    .end local v0    # "methodRef":Ljava/lang/ref/Reference;
    :goto_14
    return-object v1

    :cond_15
    const/4 v1, 0x0

    goto :goto_14
.end method

.method public static getMatchingAccessibleMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 23
    .param p0, "clazz"    # Ljava/lang/Class;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "parameterTypes"    # [Ljava/lang/Class;

    .prologue
    .line 942
    sget-object v18, Lorg/apache/commons/beanutils/MethodUtils;->class$org$apache$commons$beanutils$MethodUtils:Ljava/lang/Class;

    if-nez v18, :cond_56

    const-string v18, "org.apache.commons.beanutils.MethodUtils"

    invoke-static/range {v18 .. v18}, Lorg/apache/commons/beanutils/MethodUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v18

    sput-object v18, Lorg/apache/commons/beanutils/MethodUtils;->class$org$apache$commons$beanutils$MethodUtils:Ljava/lang/Class;

    :goto_c
    invoke-static/range {v18 .. v18}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v7

    .line 943
    .local v7, "log":Lorg/apache/commons/logging/Log;
    invoke-interface {v7}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v18

    if-eqz v18, :cond_40

    .line 944
    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string v19, "Matching name="

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string v19, " on "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v7, v0}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 946
    :cond_40
    new-instance v9, Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;

    const/16 v18, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, v18

    invoke-direct {v9, v0, v1, v2, v3}, Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;-><init>(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Z)V

    .line 952
    .local v9, "md":Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;
    :try_start_4f
    invoke-static {v9}, Lorg/apache/commons/beanutils/MethodUtils;->getCachedMethod(Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;)Ljava/lang/reflect/Method;
    :try_end_52
    .catch Ljava/lang/NoSuchMethodException; {:try_start_4f .. :try_end_52} :catch_a4

    move-result-object v10

    .line 953
    .local v10, "method":Ljava/lang/reflect/Method;
    if-eqz v10, :cond_59

    .line 1032
    .end local v10    # "method":Ljava/lang/reflect/Method;
    :goto_55
    return-object v10

    .line 942
    .end local v7    # "log":Lorg/apache/commons/logging/Log;
    .end local v9    # "md":Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;
    :cond_56
    sget-object v18, Lorg/apache/commons/beanutils/MethodUtils;->class$org$apache$commons$beanutils$MethodUtils:Ljava/lang/Class;

    goto :goto_c

    .line 957
    .restart local v7    # "log":Lorg/apache/commons/logging/Log;
    .restart local v9    # "md":Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;
    .restart local v10    # "method":Ljava/lang/reflect/Method;
    :cond_59
    :try_start_59
    invoke-virtual/range {p0 .. p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v10

    .line 958
    invoke-interface {v7}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v18

    if-eqz v18, :cond_9d

    .line 959
    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string v19, "Found straight match: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v7, v0}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 960
    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string v19, "isPublic:"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual {v10}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v19

    invoke-static/range {v19 .. v19}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v7, v0}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 963
    :cond_9d
    invoke-static {v10}, Lorg/apache/commons/beanutils/MethodUtils;->setMethodAccessible(Ljava/lang/reflect/Method;)V

    .line 965
    invoke-static {v9, v10}, Lorg/apache/commons/beanutils/MethodUtils;->cacheMethod(Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;Ljava/lang/reflect/Method;)V
    :try_end_a3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_59 .. :try_end_a3} :catch_a4

    goto :goto_55

    .line 968
    .end local v10    # "method":Ljava/lang/reflect/Method;
    :catch_a4
    move-exception v18

    .line 971
    move-object/from16 v0, p2

    array-length v0, v0

    move/from16 v16, v0

    .line 972
    .local v16, "paramSize":I
    const/4 v4, 0x0

    .line 973
    .local v4, "bestMatch":Ljava/lang/reflect/Method;
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v12

    .line 974
    .local v12, "methods":[Ljava/lang/reflect/Method;
    const v5, 0x7f7fffff    # Float.MAX_VALUE

    .line 975
    .local v5, "bestMatchCost":F
    const v14, 0x7f7fffff    # Float.MAX_VALUE

    .line 976
    .local v14, "myCost":F
    const/4 v6, 0x0

    .local v6, "i":I
    array-length v0, v12

    move/from16 v17, v0

    .local v17, "size":I
    :goto_b9
    move/from16 v0, v17

    if-ge v6, v0, :cond_1bb

    .line 977
    aget-object v18, v12, v6

    invoke-virtual/range {v18 .. v18}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_1b3

    .line 979
    invoke-interface {v7}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v18

    if-eqz v18, :cond_e1

    .line 980
    const-string v18, "Found matching name:"

    move-object/from16 v0, v18

    invoke-interface {v7, v0}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 981
    aget-object v18, v12, v6

    move-object/from16 v0, v18

    invoke-interface {v7, v0}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 985
    :cond_e1
    aget-object v18, v12, v6

    invoke-virtual/range {v18 .. v18}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v13

    .line 986
    .local v13, "methodsParams":[Ljava/lang/Class;
    array-length v11, v13

    .line 987
    .local v11, "methodParamSize":I
    move/from16 v0, v16

    if-ne v11, v0, :cond_1b3

    .line 988
    const/4 v8, 0x1

    .line 989
    .local v8, "match":Z
    const/4 v15, 0x0

    .local v15, "n":I
    :goto_ee
    if-ge v15, v11, :cond_163

    .line 990
    invoke-interface {v7}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v18

    if-eqz v18, :cond_132

    .line 991
    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string v19, "Param="

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    aget-object v19, p2, v15

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v7, v0}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 992
    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string v19, "Method="

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    aget-object v19, v13, v15

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v7, v0}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 994
    :cond_132
    aget-object v18, v13, v15

    aget-object v19, p2, v15

    invoke-static/range {v18 .. v19}, Lorg/apache/commons/beanutils/MethodUtils;->isAssignmentCompatible(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v18

    if-nez v18, :cond_1b7

    .line 995
    invoke-interface {v7}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v18

    if-eqz v18, :cond_162

    .line 996
    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    aget-object v19, v13, v15

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string v19, " is not assignable from "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    aget-object v19, p2, v15

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v7, v0}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 999
    :cond_162
    const/4 v8, 0x0

    .line 1004
    :cond_163
    if-eqz v8, :cond_1b3

    .line 1006
    aget-object v18, v12, v6

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lorg/apache/commons/beanutils/MethodUtils;->getAccessibleMethod(Ljava/lang/Class;Ljava/lang/reflect/Method;)Ljava/lang/reflect/Method;

    move-result-object v10

    .line 1007
    .restart local v10    # "method":Ljava/lang/reflect/Method;
    if-eqz v10, :cond_1ac

    .line 1008
    invoke-interface {v7}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v18

    if-eqz v18, :cond_197

    .line 1009
    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v18

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string v19, " accessible version of "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    aget-object v19, v12, v6

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v7, v0}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 1012
    :cond_197
    invoke-static {v10}, Lorg/apache/commons/beanutils/MethodUtils;->setMethodAccessible(Ljava/lang/reflect/Method;)V

    .line 1013
    invoke-virtual {v10}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v18

    move-object/from16 v0, p2

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lorg/apache/commons/beanutils/MethodUtils;->getTotalTransformationCost([Ljava/lang/Class;[Ljava/lang/Class;)F

    move-result v14

    .line 1014
    cmpg-float v18, v14, v5

    if-gez v18, :cond_1ac

    .line 1015
    move-object v4, v10

    .line 1016
    move v5, v14

    .line 1020
    :cond_1ac
    const-string v18, "Couldn\'t find accessible method."

    move-object/from16 v0, v18

    invoke-interface {v7, v0}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 976
    .end local v8    # "match":Z
    .end local v10    # "method":Ljava/lang/reflect/Method;
    .end local v11    # "methodParamSize":I
    .end local v13    # "methodsParams":[Ljava/lang/Class;
    .end local v15    # "n":I
    :cond_1b3
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_b9

    .line 989
    .restart local v8    # "match":Z
    .restart local v11    # "methodParamSize":I
    .restart local v13    # "methodsParams":[Ljava/lang/Class;
    .restart local v15    # "n":I
    :cond_1b7
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_ee

    .line 1025
    .end local v8    # "match":Z
    .end local v11    # "methodParamSize":I
    .end local v13    # "methodsParams":[Ljava/lang/Class;
    .end local v15    # "n":I
    :cond_1bb
    if-eqz v4, :cond_1c3

    .line 1026
    invoke-static {v9, v4}, Lorg/apache/commons/beanutils/MethodUtils;->cacheMethod(Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;Ljava/lang/reflect/Method;)V

    :goto_1c0
    move-object v10, v4

    .line 1032
    goto/16 :goto_55

    .line 1029
    :cond_1c3
    const-string v18, "No match found."

    move-object/from16 v0, v18

    invoke-interface {v7, v0}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    goto :goto_1c0
.end method

.method private static getObjectTransformationCost(Ljava/lang/Class;Ljava/lang/Class;)F
    .registers 4
    .param p0, "srcClass"    # Ljava/lang/Class;
    .param p1, "destClass"    # Ljava/lang/Class;

    .prologue
    .line 1120
    const/4 v0, 0x0

    .line 1121
    .local v0, "cost":F
    :goto_1
    if-eqz p1, :cond_18

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_18

    .line 1122
    invoke-virtual {p1}, Ljava/lang/Class;->isInterface()Z

    move-result v1

    if-eqz v1, :cond_1e

    invoke-static {p1, p0}, Lorg/apache/commons/beanutils/MethodUtils;->isAssignmentCompatible(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 1127
    const/high16 v1, 0x3e800000    # 0.25f

    add-float/2addr v0, v1

    .line 1138
    :cond_18
    if-nez p1, :cond_1d

    .line 1139
    const/high16 v1, 0x3fc00000    # 1.5f

    add-float/2addr v0, v1

    .line 1142
    :cond_1d
    return v0

    .line 1130
    :cond_1e
    const/high16 v1, 0x3f800000    # 1.0f

    add-float/2addr v0, v1

    .line 1131
    invoke-virtual {p1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p1

    goto :goto_1
.end method

.method public static getPrimitiveType(Ljava/lang/Class;)Ljava/lang/Class;
    .registers 4
    .param p0, "wrapperType"    # Ljava/lang/Class;

    .prologue
    .line 1221
    sget-object v1, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Boolean:Ljava/lang/Class;

    if-nez v1, :cond_15

    const-string v1, "java.lang.Boolean"

    invoke-static {v1}, Lorg/apache/commons/beanutils/MethodUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Boolean:Ljava/lang/Class;

    :goto_c
    invoke-virtual {v1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_18

    .line 1222
    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 1242
    :goto_14
    return-object v1

    .line 1221
    :cond_15
    sget-object v1, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Boolean:Ljava/lang/Class;

    goto :goto_c

    .line 1223
    :cond_18
    sget-object v1, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Float:Ljava/lang/Class;

    if-nez v1, :cond_2d

    const-string v1, "java.lang.Float"

    invoke-static {v1}, Lorg/apache/commons/beanutils/MethodUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Float:Ljava/lang/Class;

    :goto_24
    invoke-virtual {v1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_30

    .line 1224
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    goto :goto_14

    .line 1223
    :cond_2d
    sget-object v1, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Float:Ljava/lang/Class;

    goto :goto_24

    .line 1225
    :cond_30
    sget-object v1, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Long:Ljava/lang/Class;

    if-nez v1, :cond_45

    const-string v1, "java.lang.Long"

    invoke-static {v1}, Lorg/apache/commons/beanutils/MethodUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Long:Ljava/lang/Class;

    :goto_3c
    invoke-virtual {v1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_48

    .line 1226
    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    goto :goto_14

    .line 1225
    :cond_45
    sget-object v1, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Long:Ljava/lang/Class;

    goto :goto_3c

    .line 1227
    :cond_48
    sget-object v1, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Integer:Ljava/lang/Class;

    if-nez v1, :cond_5d

    const-string v1, "java.lang.Integer"

    invoke-static {v1}, Lorg/apache/commons/beanutils/MethodUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Integer:Ljava/lang/Class;

    :goto_54
    invoke-virtual {v1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_60

    .line 1228
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    goto :goto_14

    .line 1227
    :cond_5d
    sget-object v1, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Integer:Ljava/lang/Class;

    goto :goto_54

    .line 1229
    :cond_60
    sget-object v1, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Short:Ljava/lang/Class;

    if-nez v1, :cond_75

    const-string v1, "java.lang.Short"

    invoke-static {v1}, Lorg/apache/commons/beanutils/MethodUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Short:Ljava/lang/Class;

    :goto_6c
    invoke-virtual {v1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_78

    .line 1230
    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    goto :goto_14

    .line 1229
    :cond_75
    sget-object v1, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Short:Ljava/lang/Class;

    goto :goto_6c

    .line 1231
    :cond_78
    sget-object v1, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Byte:Ljava/lang/Class;

    if-nez v1, :cond_8d

    const-string v1, "java.lang.Byte"

    invoke-static {v1}, Lorg/apache/commons/beanutils/MethodUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Byte:Ljava/lang/Class;

    :goto_84
    invoke-virtual {v1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_90

    .line 1232
    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    goto :goto_14

    .line 1231
    :cond_8d
    sget-object v1, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Byte:Ljava/lang/Class;

    goto :goto_84

    .line 1233
    :cond_90
    sget-object v1, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Double:Ljava/lang/Class;

    if-nez v1, :cond_a6

    const-string v1, "java.lang.Double"

    invoke-static {v1}, Lorg/apache/commons/beanutils/MethodUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Double:Ljava/lang/Class;

    :goto_9c
    invoke-virtual {v1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a9

    .line 1234
    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    goto/16 :goto_14

    .line 1233
    :cond_a6
    sget-object v1, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Double:Ljava/lang/Class;

    goto :goto_9c

    .line 1235
    :cond_a9
    sget-object v1, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Character:Ljava/lang/Class;

    if-nez v1, :cond_bf

    const-string v1, "java.lang.Character"

    invoke-static {v1}, Lorg/apache/commons/beanutils/MethodUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Character:Ljava/lang/Class;

    :goto_b5
    invoke-virtual {v1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_c2

    .line 1236
    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    goto/16 :goto_14

    .line 1235
    :cond_bf
    sget-object v1, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Character:Ljava/lang/Class;

    goto :goto_b5

    .line 1238
    :cond_c2
    sget-object v1, Lorg/apache/commons/beanutils/MethodUtils;->class$org$apache$commons$beanutils$MethodUtils:Ljava/lang/Class;

    if-nez v1, :cond_f1

    const-string v1, "org.apache.commons.beanutils.MethodUtils"

    invoke-static {v1}, Lorg/apache/commons/beanutils/MethodUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/MethodUtils;->class$org$apache$commons$beanutils$MethodUtils:Ljava/lang/Class;

    :goto_ce
    invoke-static {v1}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    .line 1239
    .local v0, "log":Lorg/apache/commons/logging/Log;
    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_ee

    .line 1240
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Not a known primitive wrapper class: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1242
    :cond_ee
    const/4 v1, 0x0

    goto/16 :goto_14

    .line 1238
    .end local v0    # "log":Lorg/apache/commons/logging/Log;
    :cond_f1
    sget-object v1, Lorg/apache/commons/beanutils/MethodUtils;->class$org$apache$commons$beanutils$MethodUtils:Ljava/lang/Class;

    goto :goto_ce
.end method

.method public static getPrimitiveWrapper(Ljava/lang/Class;)Ljava/lang/Class;
    .registers 2
    .param p0, "primitiveType"    # Ljava/lang/Class;

    .prologue
    .line 1190
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 1191
    sget-object v0, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Boolean:Ljava/lang/Class;

    if-nez v0, :cond_15

    const-string v0, "java.lang.Boolean"

    invoke-static {v0}, Lorg/apache/commons/beanutils/MethodUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Boolean:Ljava/lang/Class;

    .line 1208
    :goto_14
    return-object v0

    .line 1191
    :cond_15
    sget-object v0, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Boolean:Ljava/lang/Class;

    goto :goto_14

    .line 1192
    :cond_18
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_30

    .line 1193
    sget-object v0, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Float:Ljava/lang/Class;

    if-nez v0, :cond_2d

    const-string v0, "java.lang.Float"

    invoke-static {v0}, Lorg/apache/commons/beanutils/MethodUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Float:Ljava/lang/Class;

    goto :goto_14

    :cond_2d
    sget-object v0, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Float:Ljava/lang/Class;

    goto :goto_14

    .line 1194
    :cond_30
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_48

    .line 1195
    sget-object v0, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Long:Ljava/lang/Class;

    if-nez v0, :cond_45

    const-string v0, "java.lang.Long"

    invoke-static {v0}, Lorg/apache/commons/beanutils/MethodUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Long:Ljava/lang/Class;

    goto :goto_14

    :cond_45
    sget-object v0, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Long:Ljava/lang/Class;

    goto :goto_14

    .line 1196
    :cond_48
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_60

    .line 1197
    sget-object v0, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Integer:Ljava/lang/Class;

    if-nez v0, :cond_5d

    const-string v0, "java.lang.Integer"

    invoke-static {v0}, Lorg/apache/commons/beanutils/MethodUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Integer:Ljava/lang/Class;

    goto :goto_14

    :cond_5d
    sget-object v0, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Integer:Ljava/lang/Class;

    goto :goto_14

    .line 1198
    :cond_60
    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_78

    .line 1199
    sget-object v0, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Short:Ljava/lang/Class;

    if-nez v0, :cond_75

    const-string v0, "java.lang.Short"

    invoke-static {v0}, Lorg/apache/commons/beanutils/MethodUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Short:Ljava/lang/Class;

    goto :goto_14

    :cond_75
    sget-object v0, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Short:Ljava/lang/Class;

    goto :goto_14

    .line 1200
    :cond_78
    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_90

    .line 1201
    sget-object v0, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Byte:Ljava/lang/Class;

    if-nez v0, :cond_8d

    const-string v0, "java.lang.Byte"

    invoke-static {v0}, Lorg/apache/commons/beanutils/MethodUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Byte:Ljava/lang/Class;

    goto :goto_14

    :cond_8d
    sget-object v0, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Byte:Ljava/lang/Class;

    goto :goto_14

    .line 1202
    :cond_90
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_aa

    .line 1203
    sget-object v0, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Double:Ljava/lang/Class;

    if-nez v0, :cond_a6

    const-string v0, "java.lang.Double"

    invoke-static {v0}, Lorg/apache/commons/beanutils/MethodUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Double:Ljava/lang/Class;

    goto/16 :goto_14

    :cond_a6
    sget-object v0, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Double:Ljava/lang/Class;

    goto/16 :goto_14

    .line 1204
    :cond_aa
    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c4

    .line 1205
    sget-object v0, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Character:Ljava/lang/Class;

    if-nez v0, :cond_c0

    const-string v0, "java.lang.Character"

    invoke-static {v0}, Lorg/apache/commons/beanutils/MethodUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Character:Ljava/lang/Class;

    goto/16 :goto_14

    :cond_c0
    sget-object v0, Lorg/apache/commons/beanutils/MethodUtils;->class$java$lang$Character:Ljava/lang/Class;

    goto/16 :goto_14

    .line 1208
    :cond_c4
    const/4 v0, 0x0

    goto/16 :goto_14
.end method

.method private static getTotalTransformationCost([Ljava/lang/Class;[Ljava/lang/Class;)F
    .registers 7
    .param p0, "srcArgs"    # [Ljava/lang/Class;
    .param p1, "destArgs"    # [Ljava/lang/Class;

    .prologue
    .line 1100
    const/4 v3, 0x0

    .line 1101
    .local v3, "totalCost":F
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    array-length v4, p0

    if-ge v1, v4, :cond_11

    .line 1103
    aget-object v2, p0, v1

    .line 1104
    .local v2, "srcClass":Ljava/lang/Class;
    aget-object v0, p1, v1

    .line 1105
    .local v0, "destClass":Ljava/lang/Class;
    invoke-static {v2, v0}, Lorg/apache/commons/beanutils/MethodUtils;->getObjectTransformationCost(Ljava/lang/Class;Ljava/lang/Class;)F

    move-result v4

    add-float/2addr v3, v4

    .line 1101
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 1108
    .end local v0    # "destClass":Ljava/lang/Class;
    .end local v2    # "srcClass":Ljava/lang/Class;
    :cond_11
    return v3
.end method

.method public static invokeExactMethod(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "arg"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 314
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    .line 315
    .local v0, "args":[Ljava/lang/Object;
    invoke-static {p0, p1, v0}, Lorg/apache/commons/beanutils/MethodUtils;->invokeExactMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static invokeExactMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 346
    if-nez p2, :cond_4

    .line 347
    sget-object p2, Lorg/apache/commons/beanutils/MethodUtils;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    .line 349
    :cond_4
    array-length v0, p2

    .line 350
    .local v0, "arguments":I
    new-array v2, v0, [Ljava/lang/Class;

    .line 351
    .local v2, "parameterTypes":[Ljava/lang/Class;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8
    if-ge v1, v0, :cond_15

    .line 352
    aget-object v3, p2, v1

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    aput-object v3, v2, v1

    .line 351
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 354
    :cond_15
    invoke-static {p0, p1, p2, v2}, Lorg/apache/commons/beanutils/MethodUtils;->invokeExactMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    return-object v3
.end method

.method public static invokeExactMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/Object;
    .registers 8
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "parameterTypes"    # [Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 388
    if-nez p2, :cond_4

    .line 389
    sget-object p2, Lorg/apache/commons/beanutils/MethodUtils;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    .line 392
    :cond_4
    if-nez p3, :cond_8

    .line 393
    sget-object p3, Lorg/apache/commons/beanutils/MethodUtils;->EMPTY_CLASS_PARAMETERS:[Ljava/lang/Class;

    .line 396
    :cond_8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p1, p3}, Lorg/apache/commons/beanutils/MethodUtils;->getAccessibleMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 400
    .local v0, "method":Ljava/lang/reflect/Method;
    if-nez v0, :cond_3d

    .line 401
    new-instance v1, Ljava/lang/NoSuchMethodException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "No such accessible method: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "() on object: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 404
    :cond_3d
    invoke-virtual {v0, p0, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static invokeExactStaticMethod(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p0, "objectClass"    # Ljava/lang/Class;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "arg"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 636
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    .line 637
    .local v0, "args":[Ljava/lang/Object;
    invoke-static {p0, p1, v0}, Lorg/apache/commons/beanutils/MethodUtils;->invokeExactStaticMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static invokeExactStaticMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .param p0, "objectClass"    # Ljava/lang/Class;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 669
    if-nez p2, :cond_4

    .line 670
    sget-object p2, Lorg/apache/commons/beanutils/MethodUtils;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    .line 672
    :cond_4
    array-length v0, p2

    .line 673
    .local v0, "arguments":I
    new-array v2, v0, [Ljava/lang/Class;

    .line 674
    .local v2, "parameterTypes":[Ljava/lang/Class;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8
    if-ge v1, v0, :cond_15

    .line 675
    aget-object v3, p2, v1

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    aput-object v3, v2, v1

    .line 674
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 677
    :cond_15
    invoke-static {p0, p1, p2, v2}, Lorg/apache/commons/beanutils/MethodUtils;->invokeExactStaticMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    return-object v3
.end method

.method public static invokeExactStaticMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/Object;
    .registers 8
    .param p0, "objectClass"    # Ljava/lang/Class;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "parameterTypes"    # [Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 438
    if-nez p2, :cond_4

    .line 439
    sget-object p2, Lorg/apache/commons/beanutils/MethodUtils;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    .line 442
    :cond_4
    if-nez p3, :cond_8

    .line 443
    sget-object p3, Lorg/apache/commons/beanutils/MethodUtils;->EMPTY_CLASS_PARAMETERS:[Ljava/lang/Class;

    .line 446
    :cond_8
    invoke-static {p0, p1, p3}, Lorg/apache/commons/beanutils/MethodUtils;->getAccessibleMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 450
    .local v0, "method":Ljava/lang/reflect/Method;
    if-nez v0, :cond_35

    .line 451
    new-instance v1, Ljava/lang/NoSuchMethodException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "No such accessible method: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "() on class: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 454
    :cond_35
    const/4 v1, 0x0

    invoke-virtual {v0, v1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static invokeMethod(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "arg"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 176
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    .line 177
    .local v0, "args":[Ljava/lang/Object;
    invoke-static {p0, p1, v0}, Lorg/apache/commons/beanutils/MethodUtils;->invokeMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static invokeMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 218
    if-nez p2, :cond_4

    .line 219
    sget-object p2, Lorg/apache/commons/beanutils/MethodUtils;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    .line 221
    :cond_4
    array-length v0, p2

    .line 222
    .local v0, "arguments":I
    new-array v2, v0, [Ljava/lang/Class;

    .line 223
    .local v2, "parameterTypes":[Ljava/lang/Class;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8
    if-ge v1, v0, :cond_15

    .line 224
    aget-object v3, p2, v1

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    aput-object v3, v2, v1

    .line 223
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 226
    :cond_15
    invoke-static {p0, p1, p2, v2}, Lorg/apache/commons/beanutils/MethodUtils;->invokeMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    return-object v3
.end method

.method public static invokeMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/Object;
    .registers 8
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "parameterTypes"    # [Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 267
    if-nez p3, :cond_4

    .line 268
    sget-object p3, Lorg/apache/commons/beanutils/MethodUtils;->EMPTY_CLASS_PARAMETERS:[Ljava/lang/Class;

    .line 270
    :cond_4
    if-nez p2, :cond_8

    .line 271
    sget-object p2, Lorg/apache/commons/beanutils/MethodUtils;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    .line 274
    :cond_8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p1, p3}, Lorg/apache/commons/beanutils/MethodUtils;->getMatchingAccessibleMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 278
    .local v0, "method":Ljava/lang/reflect/Method;
    if-nez v0, :cond_3d

    .line 279
    new-instance v1, Ljava/lang/NoSuchMethodException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "No such accessible method: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "() on object: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 282
    :cond_3d
    invoke-virtual {v0, p0, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static invokeStaticMethod(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p0, "objectClass"    # Ljava/lang/Class;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "arg"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 495
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    .line 496
    .local v0, "args":[Ljava/lang/Object;
    invoke-static {p0, p1, v0}, Lorg/apache/commons/beanutils/MethodUtils;->invokeStaticMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static invokeStaticMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .param p0, "objectClass"    # Ljava/lang/Class;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 538
    if-nez p2, :cond_4

    .line 539
    sget-object p2, Lorg/apache/commons/beanutils/MethodUtils;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    .line 541
    :cond_4
    array-length v0, p2

    .line 542
    .local v0, "arguments":I
    new-array v2, v0, [Ljava/lang/Class;

    .line 543
    .local v2, "parameterTypes":[Ljava/lang/Class;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8
    if-ge v1, v0, :cond_15

    .line 544
    aget-object v3, p2, v1

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    aput-object v3, v2, v1

    .line 543
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 546
    :cond_15
    invoke-static {p0, p1, p2, v2}, Lorg/apache/commons/beanutils/MethodUtils;->invokeStaticMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    return-object v3
.end method

.method public static invokeStaticMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/Object;
    .registers 8
    .param p0, "objectClass"    # Ljava/lang/Class;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "parameterTypes"    # [Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 588
    if-nez p3, :cond_4

    .line 589
    sget-object p3, Lorg/apache/commons/beanutils/MethodUtils;->EMPTY_CLASS_PARAMETERS:[Ljava/lang/Class;

    .line 591
    :cond_4
    if-nez p2, :cond_8

    .line 592
    sget-object p2, Lorg/apache/commons/beanutils/MethodUtils;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    .line 595
    :cond_8
    invoke-static {p0, p1, p3}, Lorg/apache/commons/beanutils/MethodUtils;->getMatchingAccessibleMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 599
    .local v0, "method":Ljava/lang/reflect/Method;
    if-nez v0, :cond_35

    .line 600
    new-instance v1, Ljava/lang/NoSuchMethodException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "No such accessible method: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "() on class: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 603
    :cond_35
    const/4 v1, 0x0

    invoke-virtual {v0, v1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static final isAssignmentCompatible(Ljava/lang/Class;Ljava/lang/Class;)Z
    .registers 4
    .param p0, "parameterType"    # Ljava/lang/Class;
    .param p1, "parameterization"    # Ljava/lang/Class;

    .prologue
    .line 1165
    invoke-virtual {p0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 1166
    const/4 v1, 0x1

    .line 1178
    :goto_7
    return v1

    .line 1169
    :cond_8
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v1

    if-eqz v1, :cond_19

    .line 1172
    invoke-static {p0}, Lorg/apache/commons/beanutils/MethodUtils;->getPrimitiveWrapper(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    .line 1173
    .local v0, "parameterWrapperClazz":Ljava/lang/Class;
    if-eqz v0, :cond_19

    .line 1174
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_7

    .line 1178
    .end local v0    # "parameterWrapperClazz":Ljava/lang/Class;
    :cond_19
    const/4 v1, 0x0

    goto :goto_7
.end method

.method public static declared-synchronized setCacheMethods(Z)V
    .registers 3
    .param p0, "cacheMethods"    # Z

    .prologue
    .line 123
    const-class v1, Lorg/apache/commons/beanutils/MethodUtils;

    monitor-enter v1

    :try_start_3
    sput-boolean p0, Lorg/apache/commons/beanutils/MethodUtils;->CACHE_METHODS:Z

    .line 124
    sget-boolean v0, Lorg/apache/commons/beanutils/MethodUtils;->CACHE_METHODS:Z

    if-nez v0, :cond_c

    .line 125
    invoke-static {}, Lorg/apache/commons/beanutils/MethodUtils;->clearCache()I
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_e

    .line 127
    :cond_c
    monitor-exit v1

    return-void

    .line 123
    :catchall_e
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static setMethodAccessible(Ljava/lang/reflect/Method;)V
    .registers 10
    .param p0, "method"    # Ljava/lang/reflect/Method;

    .prologue
    const/16 v8, 0x31

    const/4 v7, 0x1

    .line 1057
    :try_start_3
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->isAccessible()Z

    move-result v5

    if-nez v5, :cond_d

    .line 1058
    const/4 v5, 0x1

    invoke-virtual {p0, v5}, Ljava/lang/reflect/Method;->setAccessible(Z)V
    :try_end_d
    .catch Ljava/lang/SecurityException; {:try_start_3 .. :try_end_d} :catch_e

    .line 1089
    :cond_d
    :goto_d
    return-void

    .line 1061
    :catch_e
    move-exception v2

    .line 1063
    .local v2, "se":Ljava/lang/SecurityException;
    sget-object v5, Lorg/apache/commons/beanutils/MethodUtils;->class$org$apache$commons$beanutils$MethodUtils:Ljava/lang/Class;

    if-nez v5, :cond_63

    const-string v5, "org.apache.commons.beanutils.MethodUtils"

    invoke-static {v5}, Lorg/apache/commons/beanutils/MethodUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    sput-object v5, Lorg/apache/commons/beanutils/MethodUtils;->class$org$apache$commons$beanutils$MethodUtils:Ljava/lang/Class;

    :goto_1b
    invoke-static {v5}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v1

    .line 1064
    .local v1, "log":Lorg/apache/commons/logging/Log;
    sget-boolean v5, Lorg/apache/commons/beanutils/MethodUtils;->loggedAccessibleWarning:Z

    if-nez v5, :cond_5d

    .line 1065
    const/4 v4, 0x0

    .line 1067
    .local v4, "vulnerableJVM":Z
    :try_start_24
    const-string v5, "java.specification.version"

    invoke-static {v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1068
    .local v3, "specVersion":Ljava/lang/String;
    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v5, v8, :cond_54

    const/4 v5, 0x2

    invoke-virtual {v3, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x30

    if-eq v5, v6, :cond_53

    const/4 v5, 0x2

    invoke-virtual {v3, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-eq v5, v8, :cond_53

    const/4 v5, 0x2

    invoke-virtual {v3, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x32

    if-eq v5, v6, :cond_53

    const/4 v5, 0x2

    invoke-virtual {v3, v5}, Ljava/lang/String;->charAt(I)C
    :try_end_4e
    .catch Ljava/lang/SecurityException; {:try_start_24 .. :try_end_4e} :catch_66

    move-result v5

    const/16 v6, 0x33

    if-ne v5, v6, :cond_54

    .line 1074
    :cond_53
    const/4 v4, 0x1

    .line 1080
    .end local v3    # "specVersion":Ljava/lang/String;
    :cond_54
    :goto_54
    if-eqz v4, :cond_5b

    .line 1081
    const-string v5, "Current Security Manager restricts use of workarounds for reflection bugs  in pre-1.4 JVMs."

    invoke-interface {v1, v5}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 1085
    :cond_5b
    sput-boolean v7, Lorg/apache/commons/beanutils/MethodUtils;->loggedAccessibleWarning:Z

    .line 1087
    .end local v4    # "vulnerableJVM":Z
    :cond_5d
    const-string v5, "Cannot setAccessible on method. Therefore cannot use jvm access bug workaround."

    invoke-interface {v1, v5, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_d

    .line 1063
    .end local v1    # "log":Lorg/apache/commons/logging/Log;
    :cond_63
    sget-object v5, Lorg/apache/commons/beanutils/MethodUtils;->class$org$apache$commons$beanutils$MethodUtils:Ljava/lang/Class;

    goto :goto_1b

    .line 1076
    .restart local v1    # "log":Lorg/apache/commons/logging/Log;
    .restart local v4    # "vulnerableJVM":Z
    :catch_66
    move-exception v0

    .line 1078
    .local v0, "e":Ljava/lang/SecurityException;
    const/4 v4, 0x1

    goto :goto_54
.end method

.method public static toNonPrimitiveClass(Ljava/lang/Class;)Ljava/lang/Class;
    .registers 3
    .param p0, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 1253
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v1

    if-eqz v1, :cond_d

    .line 1254
    invoke-static {p0}, Lorg/apache/commons/beanutils/MethodUtils;->getPrimitiveWrapper(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    .line 1256
    .local v0, "primitiveClazz":Ljava/lang/Class;
    if-eqz v0, :cond_d

    move-object p0, v0

    .line 1262
    .end local v0    # "primitiveClazz":Ljava/lang/Class;
    .end local p0    # "clazz":Ljava/lang/Class;
    :cond_d
    return-object p0
.end method
