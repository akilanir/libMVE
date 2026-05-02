.class public Landroid/app/AndroidAppHelper;
.super Ljava/lang/Object;
.source "AndroidAppHelper.java"


# static fields
.field private static CLASS_RESOURCES_KEY:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private static HAS_IS_THEMEABLE:Z


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x0

    .line 26
    const/4 v1, 0x0

    sput-boolean v1, Landroid/app/AndroidAppHelper;->HAS_IS_THEMEABLE:Z

    .line 29
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x13

    if-ge v1, v2, :cond_1d

    .line 30
    const-string v1, "android.app.ActivityThread$ResourcesKey"

    invoke-static {v1, v3}, Lde/robv/android/xposed/XposedHelpers;->findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    .line 29
    :goto_10
    sput-object v1, Landroid/app/AndroidAppHelper;->CLASS_RESOURCES_KEY:Ljava/lang/Class;

    .line 35
    :try_start_12
    sget-object v1, Landroid/app/AndroidAppHelper;->CLASS_RESOURCES_KEY:Ljava/lang/Class;

    const-string v2, "mIsThemeable"

    invoke-static {v1, v2}, Lde/robv/android/xposed/XposedHelpers;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 36
    const/4 v1, 0x1

    sput-boolean v1, Landroid/app/AndroidAppHelper;->HAS_IS_THEMEABLE:Z
    :try_end_1c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_12 .. :try_end_1c} :catch_29
    .catch Ljava/lang/Throwable; {:try_start_12 .. :try_end_1c} :catch_24

    .line 39
    :goto_1c
    return-void

    .line 31
    :cond_1d
    const-string v1, "android.content.res.ResourcesKey"

    invoke-static {v1, v3}, Lde/robv/android/xposed/XposedHelpers;->findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    goto :goto_10

    .line 38
    :catch_24
    move-exception v0

    .local v0, "t":Ljava/lang/Throwable;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    goto :goto_1c

    .line 37
    .end local v0    # "t":Ljava/lang/Throwable;
    :catch_29
    move-exception v1

    goto :goto_1c
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addActiveResource(Ljava/lang/String;FZLandroid/content/res/Resources;)V
    .registers 12
    .param p0, "resDir"    # Ljava/lang/String;
    .param p1, "scale"    # F
    .param p2, "isThemeable"    # Z
    .param p3, "resources"    # Landroid/content/res/Resources;

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 91
    invoke-static {}, Landroid/app/ActivityThread;->currentActivityThread()Landroid/app/ActivityThread;

    move-result-object v7

    .line 92
    .local v7, "thread":Landroid/app/ActivityThread;
    if-nez v7, :cond_9

    .line 105
    :cond_8
    :goto_8
    return-void

    .line 96
    :cond_9
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x10

    if-gt v0, v3, :cond_22

    .line 97
    invoke-static {p0, p1, p2}, Landroid/app/AndroidAppHelper;->createResourcesKey(Ljava/lang/String;FZ)Ljava/lang/Object;

    move-result-object v6

    .line 103
    .local v6, "resourcesKey":Ljava/lang/Object;
    :goto_13
    if-eqz v6, :cond_8

    .line 104
    invoke-static {v7}, Landroid/app/AndroidAppHelper;->getActiveResources(Landroid/app/ActivityThread;)Ljava/util/Map;

    move-result-object v0

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_8

    .line 98
    .end local v6    # "resourcesKey":Ljava/lang/Object;
    :cond_22
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x12

    if-gt v0, v3, :cond_2d

    .line 99
    invoke-static {p0, v1, v2, p1, p2}, Landroid/app/AndroidAppHelper;->createResourcesKey(Ljava/lang/String;ILandroid/content/res/Configuration;FZ)Ljava/lang/Object;

    move-result-object v6

    .restart local v6    # "resourcesKey":Ljava/lang/Object;
    goto :goto_13

    .end local v6    # "resourcesKey":Ljava/lang/Object;
    :cond_2d
    move-object v0, p0

    move v3, p1

    move-object v4, v2

    move v5, p2

    .line 101
    invoke-static/range {v0 .. v5}, Landroid/app/AndroidAppHelper;->createResourcesKey(Ljava/lang/String;ILandroid/content/res/Configuration;FLandroid/os/IBinder;Z)Ljava/lang/Object;

    move-result-object v6

    .restart local v6    # "resourcesKey":Ljava/lang/Object;
    goto :goto_13
.end method

.method private static createResourcesKey(Ljava/lang/String;FZ)Ljava/lang/Object;
    .registers 8
    .param p0, "resDir"    # Ljava/lang/String;
    .param p1, "scale"    # F
    .param p2, "isThemeable"    # Z

    .prologue
    .line 54
    :try_start_0
    sget-boolean v1, Landroid/app/AndroidAppHelper;->HAS_IS_THEMEABLE:Z

    if-eqz v1, :cond_1f

    .line 55
    sget-object v1, Landroid/app/AndroidAppHelper;->CLASS_RESOURCES_KEY:Ljava/lang/Class;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Lde/robv/android/xposed/XposedHelpers;->newInstance(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 60
    :goto_1e
    return-object v1

    .line 57
    :cond_1f
    sget-object v1, Landroid/app/AndroidAppHelper;->CLASS_RESOURCES_KEY:Ljava/lang/Class;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Lde/robv/android/xposed/XposedHelpers;->newInstance(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_31
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_31} :catch_33

    move-result-object v1

    goto :goto_1e

    .line 58
    :catch_33
    move-exception v0

    .line 59
    .local v0, "t":Ljava/lang/Throwable;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 60
    const/4 v1, 0x0

    goto :goto_1e
.end method

.method private static createResourcesKey(Ljava/lang/String;ILandroid/content/res/Configuration;FLandroid/os/IBinder;Z)Ljava/lang/Object;
    .registers 11
    .param p0, "resDir"    # Ljava/lang/String;
    .param p1, "displayId"    # I
    .param p2, "overrideConfiguration"    # Landroid/content/res/Configuration;
    .param p3, "scale"    # F
    .param p4, "token"    # Landroid/os/IBinder;
    .param p5, "isThemeable"    # Z

    .prologue
    .line 80
    :try_start_0
    sget-boolean v1, Landroid/app/AndroidAppHelper;->HAS_IS_THEMEABLE:Z

    if-eqz v1, :cond_2c

    .line 81
    sget-object v1, Landroid/app/AndroidAppHelper;->CLASS_RESOURCES_KEY:Ljava/lang/Class;

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object p2, v2, v3

    const/4 v3, 0x3

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x4

    invoke-static {p5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x5

    aput-object p4, v2, v3

    invoke-static {v1, v2}, Lde/robv/android/xposed/XposedHelpers;->newInstance(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 86
    :goto_2b
    return-object v1

    .line 83
    :cond_2c
    sget-object v1, Landroid/app/AndroidAppHelper;->CLASS_RESOURCES_KEY:Ljava/lang/Class;

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object p2, v2, v3

    const/4 v3, 0x3

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x4

    aput-object p4, v2, v3

    invoke-static {v1, v2}, Lde/robv/android/xposed/XposedHelpers;->newInstance(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4b
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_4b} :catch_4d

    move-result-object v1

    goto :goto_2b

    .line 84
    :catch_4d
    move-exception v0

    .line 85
    .local v0, "t":Ljava/lang/Throwable;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 86
    const/4 v1, 0x0

    goto :goto_2b
.end method

.method private static createResourcesKey(Ljava/lang/String;ILandroid/content/res/Configuration;FZ)Ljava/lang/Object;
    .registers 10
    .param p0, "resDir"    # Ljava/lang/String;
    .param p1, "displayId"    # I
    .param p2, "overrideConfiguration"    # Landroid/content/res/Configuration;
    .param p3, "scale"    # F
    .param p4, "isThemeable"    # Z

    .prologue
    .line 67
    :try_start_0
    sget-boolean v1, Landroid/app/AndroidAppHelper;->HAS_IS_THEMEABLE:Z

    if-eqz v1, :cond_29

    .line 68
    sget-object v1, Landroid/app/AndroidAppHelper;->CLASS_RESOURCES_KEY:Ljava/lang/Class;

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object p2, v2, v3

    const/4 v3, 0x3

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x4

    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Lde/robv/android/xposed/XposedHelpers;->newInstance(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 73
    :goto_28
    return-object v1

    .line 70
    :cond_29
    sget-object v1, Landroid/app/AndroidAppHelper;->CLASS_RESOURCES_KEY:Ljava/lang/Class;

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object p2, v2, v3

    const/4 v3, 0x3

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Lde/robv/android/xposed/XposedHelpers;->newInstance(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_45
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_45} :catch_47

    move-result-object v1

    goto :goto_28

    .line 71
    :catch_47
    move-exception v0

    .line 72
    .local v0, "t":Ljava/lang/Throwable;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 73
    const/4 v1, 0x0

    goto :goto_28
.end method

.method public static currentApplication()Landroid/app/Application;
    .registers 1

    .prologue
    .line 132
    invoke-static {}, Landroid/app/ActivityThread;->currentApplication()Landroid/app/Application;

    move-result-object v0

    return-object v0
.end method

.method public static currentApplicationInfo()Landroid/content/pm/ApplicationInfo;
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 115
    invoke-static {}, Landroid/app/ActivityThread;->currentActivityThread()Landroid/app/ActivityThread;

    move-result-object v0

    .line 116
    .local v0, "am":Landroid/app/ActivityThread;
    if-nez v0, :cond_8

    .line 123
    :cond_7
    :goto_7
    return-object v2

    .line 119
    :cond_8
    const-string v3, "mBoundApplication"

    invoke-static {v0, v3}, Lde/robv/android/xposed/XposedHelpers;->getObjectField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 120
    .local v1, "boundApplication":Ljava/lang/Object;
    if-eqz v1, :cond_7

    .line 123
    const-string v2, "appInfo"

    invoke-static {v1, v2}, Lde/robv/android/xposed/XposedHelpers;->getObjectField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/ApplicationInfo;

    goto :goto_7
.end method

.method public static currentPackageName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 127
    invoke-static {}, Landroid/app/AndroidAppHelper;->currentApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 128
    .local v0, "ai":Landroid/content/pm/ApplicationInfo;
    if-eqz v0, :cond_9

    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    :goto_8
    return-object v1

    :cond_9
    const-string v1, "android"

    goto :goto_8
.end method

.method public static currentProcessName()Ljava/lang/String;
    .registers 1

    .prologue
    .line 108
    invoke-static {}, Landroid/app/ActivityThread;->currentPackageName()Ljava/lang/String;

    move-result-object v0

    .line 109
    .local v0, "processName":Ljava/lang/String;
    if-nez v0, :cond_8

    .line 110
    const-string v0, "android"

    .line 111
    .end local v0    # "processName":Ljava/lang/String;
    :cond_8
    return-object v0
.end method

.method private static getActiveResources(Landroid/app/ActivityThread;)Ljava/util/Map;
    .registers 4
    .param p0, "activityThread"    # Landroid/app/ActivityThread;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/ActivityThread;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/content/res/Resources;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 43
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x12

    if-gt v1, v2, :cond_f

    .line 44
    const-string v1, "mActiveResources"

    invoke-static {p0, v1}, Lde/robv/android/xposed/XposedHelpers;->getObjectField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 47
    :goto_e
    return-object v1

    .line 46
    :cond_f
    const-string v1, "mResourcesManager"

    invoke-static {p0, v1}, Lde/robv/android/xposed/XposedHelpers;->getObjectField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 47
    .local v0, "resourcesManager":Ljava/lang/Object;
    const-string v1, "mActiveResources"

    invoke-static {v0, v1}, Lde/robv/android/xposed/XposedHelpers;->getObjectField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    goto :goto_e
.end method

.method public static getDefaultSharedPreferencesForPackage(Ljava/lang/String;)Landroid/content/SharedPreferences;
    .registers 2
    .param p0, "packageName"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 144
    new-instance v0, Lde/robv/android/xposed/XSharedPreferences;

    invoke-direct {v0, p0}, Lde/robv/android/xposed/XSharedPreferences;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static getSharedPreferencesForPackage(Ljava/lang/String;Ljava/lang/String;I)Landroid/content/SharedPreferences;
    .registers 4
    .param p0, "packageName"    # Ljava/lang/String;
    .param p1, "prefFileName"    # Ljava/lang/String;
    .param p2, "mode"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 138
    new-instance v0, Lde/robv/android/xposed/XSharedPreferences;

    invoke-direct {v0, p0, p1}, Lde/robv/android/xposed/XSharedPreferences;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static reloadSharedPreferencesIfNeeded(Landroid/content/SharedPreferences;)V
    .registers 2
    .param p0, "pref"    # Landroid/content/SharedPreferences;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 150
    instance-of v0, p0, Lde/robv/android/xposed/XSharedPreferences;

    if-eqz v0, :cond_9

    .line 151
    check-cast p0, Lde/robv/android/xposed/XSharedPreferences;

    .end local p0    # "pref":Landroid/content/SharedPreferences;
    invoke-virtual {p0}, Lde/robv/android/xposed/XSharedPreferences;->reload()V

    .line 153
    :cond_9
    return-void
.end method
