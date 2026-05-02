.class public Lorg/androidannotations/api/roboguice/RoboGuiceHelper;
.super Ljava/lang/Object;
.source "RoboGuiceHelper.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static callInjectViews(Ljava/lang/Object;)V
    .registers 8
    .param p0, "activity"    # Ljava/lang/Object;

    .prologue
    .line 14
    :try_start_0
    const-string v3, "roboguice.inject.ViewListener$ViewMembersInjector"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 15
    .local v2, "viewMembersInjectorClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "injectViews"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Ljava/lang/Object;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 16
    .local v1, "injectViewsMethod":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 17
    const/4 v3, 0x0

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p0, v4, v5

    invoke-virtual {v1, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_22
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_22} :catch_23
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_22} :catch_28
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_22} :catch_2d
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_22} :catch_32
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_22} :catch_37
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_22} :catch_3c

    .line 31
    .end local v1    # "injectViewsMethod":Ljava/lang/reflect/Method;
    .end local v2    # "viewMembersInjectorClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_22
    return-void

    .line 18
    :catch_23
    move-exception v0

    .line 19
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    invoke-static {v0}, Lorg/androidannotations/api/roboguice/RoboGuiceHelper;->propagateRuntimeException(Ljava/lang/Throwable;)V

    goto :goto_22

    .line 20
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    :catch_28
    move-exception v0

    .line 21
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    invoke-static {v0}, Lorg/androidannotations/api/roboguice/RoboGuiceHelper;->propagateRuntimeException(Ljava/lang/Throwable;)V

    goto :goto_22

    .line 22
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :catch_2d
    move-exception v0

    .line 23
    .local v0, "e":Ljava/lang/SecurityException;
    invoke-static {v0}, Lorg/androidannotations/api/roboguice/RoboGuiceHelper;->propagateRuntimeException(Ljava/lang/Throwable;)V

    goto :goto_22

    .line 24
    .end local v0    # "e":Ljava/lang/SecurityException;
    :catch_32
    move-exception v0

    .line 25
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lorg/androidannotations/api/roboguice/RoboGuiceHelper;->propagateRuntimeException(Ljava/lang/Throwable;)V

    goto :goto_22

    .line 26
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_37
    move-exception v0

    .line 27
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    invoke-static {v0}, Lorg/androidannotations/api/roboguice/RoboGuiceHelper;->propagateRuntimeException(Ljava/lang/Throwable;)V

    goto :goto_22

    .line 28
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_3c
    move-exception v0

    .line 29
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-static {v0}, Lorg/androidannotations/api/roboguice/RoboGuiceHelper;->propagateRuntimeException(Ljava/lang/Throwable;)V

    goto :goto_22
.end method

.method private static propagateRuntimeException(Ljava/lang/Throwable;)V
    .registers 3
    .param p0, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 34
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Could not invoke RoboGuice method!"

    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method
