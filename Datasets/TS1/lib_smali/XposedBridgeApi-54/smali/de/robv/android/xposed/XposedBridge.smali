.class public final Lde/robv/android/xposed/XposedBridge;
.super Ljava/lang/Object;
.source "XposedBridge.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/robv/android/xposed/XposedBridge$AdditionalHookInfo;,
        Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;
    }
.end annotation


# static fields
.field public static final BASE_DIR:Ljava/lang/String; = "/data/data/de.robv.android.xposed.installer/"
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SdCardPath"
        }
    .end annotation
.end field

.field public static final BOOTCLASSLOADER:Ljava/lang/ClassLoader;

.field private static final EMPTY_ARRAY:[Ljava/lang/Object;

.field public static final INSTALLER_PACKAGE_NAME:Ljava/lang/String; = "de.robv.android.xposed.installer"

.field private static final MAX_LOGFILE_SIZE:I = 0x5000

.field public static XPOSED_BRIDGE_VERSION:I

.field private static disableHooks:Z

.field public static disableResources:Z

.field private static logWriter:Ljava/io/PrintWriter;

.field private static final sHookedMethodCallbacks:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/Member;",
            "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet",
            "<",
            "Lde/robv/android/xposed/XC_MethodHook;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final sInitPackageResourcesCallbacks:Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet",
            "<",
            "Lde/robv/android/xposed/callbacks/XC_InitPackageResources;",
            ">;"
        }
    .end annotation
.end field

.field private static final sLoadedPackageCallbacks:Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet",
            "<",
            "Lde/robv/android/xposed/callbacks/XC_LoadPackage;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x0

    .line 66
    const/4 v0, 0x0

    sput-object v0, Lde/robv/android/xposed/XposedBridge;->logWriter:Ljava/io/PrintWriter;

    .line 69
    sput-boolean v1, Lde/robv/android/xposed/XposedBridge;->disableHooks:Z

    .line 70
    sput-boolean v1, Lde/robv/android/xposed/XposedBridge;->disableResources:Z

    .line 72
    new-array v0, v1, [Ljava/lang/Object;

    sput-object v0, Lde/robv/android/xposed/XposedBridge;->EMPTY_ARRAY:[Ljava/lang/Object;

    .line 73
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    sput-object v0, Lde/robv/android/xposed/XposedBridge;->BOOTCLASSLOADER:Ljava/lang/ClassLoader;

    .line 79
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 78
    sput-object v0, Lde/robv/android/xposed/XposedBridge;->sHookedMethodCallbacks:Ljava/util/Map;

    .line 81
    new-instance v0, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    invoke-direct {v0}, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;-><init>()V

    .line 80
    sput-object v0, Lde/robv/android/xposed/XposedBridge;->sLoadedPackageCallbacks:Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    .line 83
    new-instance v0, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    invoke-direct {v0}, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;-><init>()V

    .line 82
    sput-object v0, Lde/robv/android/xposed/XposedBridge;->sInitPackageResourcesCallbacks:Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    .line 83
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()[Ljava/lang/Object;
    .registers 1

    .prologue
    .line 72
    sget-object v0, Lde/robv/android/xposed/XposedBridge;->EMPTY_ARRAY:[Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$1(Z)V
    .registers 1

    .prologue
    .line 69
    sput-boolean p0, Lde/robv/android/xposed/XposedBridge;->disableHooks:Z

    return-void
.end method

.method static synthetic access$2()Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;
    .registers 1

    .prologue
    .line 80
    sget-object v0, Lde/robv/android/xposed/XposedBridge;->sLoadedPackageCallbacks:Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    return-object v0
.end method

.method static synthetic access$3(Ljava/lang/ClassLoader;)V
    .registers 1

    .prologue
    .line 372
    invoke-static {p0}, Lde/robv/android/xposed/XposedBridge;->hookXposedInstaller(Ljava/lang/ClassLoader;)V

    return-void
.end method

.method static synthetic access$4(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 782
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedBridge;->cloneToSubclass(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$5()Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;
    .registers 1

    .prologue
    .line 82
    sget-object v0, Lde/robv/android/xposed/XposedBridge;->sInitPackageResourcesCallbacks:Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    return-object v0
.end method

.method static synthetic access$6(Ljava/lang/Object;Ljava/lang/Class;)V
    .registers 2

    .prologue
    .line 759
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedBridge;->setObjectClass(Ljava/lang/Object;Ljava/lang/Class;)V

    return-void
.end method

.method private static cloneToSubclass(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 5
    .param p0, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 783
    .local p1, "targetClazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p0, :cond_4

    .line 784
    const/4 v0, 0x0

    .line 789
    :goto_3
    return-object v0

    .line 786
    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_2f

    .line 787
    new-instance v0, Ljava/lang/ClassCastException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " doesn\'t extend "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 789
    :cond_2f
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedBridge;->cloneToSubclassNative(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_3
.end method

.method private static native cloneToSubclassNative(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation
.end method

.method private static determineXposedVersion()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 140
    new-instance v2, Ljava/util/zip/ZipInputStream;

    new-instance v4, Ljava/io/FileInputStream;

    const-string v5, "/data/data/de.robv.android.xposed.installer/bin/XposedBridge.jar"

    invoke-direct {v4, v5}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v4}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    .line 143
    .local v2, "is":Ljava/util/zip/ZipInputStream;
    :cond_c
    :try_start_c
    invoke-virtual {v2}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v1

    .local v1, "entry":Ljava/util/zip/ZipEntry;
    if-nez v1, :cond_1f

    .line 156
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "could not find assets/VERSION in /data/data/de.robv.android.xposed.installer/bin/XposedBridge.jar"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_1a
    .catchall {:try_start_c .. :try_end_1a} :catchall_1a

    .line 157
    .end local v1    # "entry":Ljava/util/zip/ZipEntry;
    :catchall_1a
    move-exception v4

    .line 159
    :try_start_1b
    invoke-virtual {v2}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_1e} :catch_67

    .line 161
    :goto_1e
    throw v4

    .line 144
    .restart local v1    # "entry":Ljava/util/zip/ZipEntry;
    :cond_1f
    :try_start_1f
    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "assets/VERSION"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 147
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    invoke-direct {v4, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 148
    .local v0, "br":Ljava/io/BufferedReader;
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .line 149
    .local v3, "version":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 151
    invoke-static {v3}, Lde/robv/android/xposed/XposedBridge;->extractIntPart(Ljava/lang/String;)I

    move-result v4

    sput v4, Lde/robv/android/xposed/XposedBridge;->XPOSED_BRIDGE_VERSION:I

    .line 152
    sget v4, Lde/robv/android/xposed/XposedBridge;->XPOSED_BRIDGE_VERSION:I

    if-nez v4, :cond_61

    .line 153
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "could not parse XposedBridge version from \""

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_61
    .catchall {:try_start_1f .. :try_end_61} :catchall_1a

    .line 159
    :cond_61
    :try_start_61
    invoke-virtual {v2}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_64
    .catch Ljava/lang/Exception; {:try_start_61 .. :try_end_64} :catch_65

    .line 154
    :goto_64
    return-void

    .line 160
    :catch_65
    move-exception v4

    goto :goto_64

    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v1    # "entry":Ljava/util/zip/ZipEntry;
    .end local v3    # "version":Ljava/lang/String;
    :catch_67
    move-exception v5

    goto :goto_1e
.end method

.method static native dumpObjectNative(Ljava/lang/Object;)V
.end method

.method private static extractIntPart(Ljava/lang/String;)I
    .registers 7
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 165
    const/4 v3, 0x0

    .local v3, "result":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 166
    .local v1, "length":I
    const/4 v2, 0x0

    .local v2, "offset":I
    :goto_6
    if-lt v2, v1, :cond_9

    .line 173
    :cond_8
    return v3

    .line 167
    :cond_9
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 168
    .local v0, "c":C
    const/16 v4, 0x30

    if-gt v4, v0, :cond_8

    const/16 v4, 0x39

    if-gt v0, v4, :cond_8

    .line 169
    mul-int/lit8 v4, v3, 0xa

    add-int/lit8 v5, v0, -0x30

    add-int v3, v4, v5

    .line 166
    add-int/lit8 v2, v2, 0x1

    goto :goto_6
.end method

.method private static native getStartClassName()Ljava/lang/String;
.end method

.method private static handleHookedMethod(Ljava/lang/reflect/Member;ILjava/lang/Object;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 22
    .param p0, "method"    # Ljava/lang/reflect/Member;
    .param p1, "originalMethodId"    # I
    .param p2, "additionalInfoObj"    # Ljava/lang/Object;
    .param p3, "thisObject"    # Ljava/lang/Object;
    .param p4, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 580
    move-object/from16 v7, p2

    check-cast v7, Lde/robv/android/xposed/XposedBridge$AdditionalHookInfo;

    .line 582
    .local v7, "additionalInfo":Lde/robv/android/xposed/XposedBridge$AdditionalHookInfo;
    sget-boolean v1, Lde/robv/android/xposed/XposedBridge;->disableHooks:Z

    if-eqz v1, :cond_1f

    .line 584
    :try_start_8
    iget-object v3, v7, Lde/robv/android/xposed/XposedBridge$AdditionalHookInfo;->parameterTypes:[Ljava/lang/Class;

    .line 585
    iget-object v4, v7, Lde/robv/android/xposed/XposedBridge$AdditionalHookInfo;->returnType:Ljava/lang/Class;

    move-object/from16 v1, p0

    move/from16 v2, p1

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    .line 584
    invoke-static/range {v1 .. v6}, Lde/robv/android/xposed/XposedBridge;->invokeOriginalMethodNative(Ljava/lang/reflect/Member;I[Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_17
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_8 .. :try_end_17} :catch_19

    move-result-object v1

    .line 661
    :goto_18
    return-object v1

    .line 586
    :catch_19
    move-exception v12

    .line 587
    .local v12, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v12}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    throw v1

    .line 591
    .end local v12    # "e":Ljava/lang/reflect/InvocationTargetException;
    :cond_1f
    iget-object v1, v7, Lde/robv/android/xposed/XposedBridge$AdditionalHookInfo;->callbacks:Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    invoke-virtual {v1}, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;->getSnapshot()[Ljava/lang/Object;

    move-result-object v11

    .line 592
    .local v11, "callbacksSnapshot":[Ljava/lang/Object;
    array-length v10, v11

    .line 593
    .local v10, "callbacksLength":I
    if-nez v10, :cond_3f

    .line 595
    :try_start_28
    iget-object v3, v7, Lde/robv/android/xposed/XposedBridge$AdditionalHookInfo;->parameterTypes:[Ljava/lang/Class;

    .line 596
    iget-object v4, v7, Lde/robv/android/xposed/XposedBridge$AdditionalHookInfo;->returnType:Ljava/lang/Class;

    move-object/from16 v1, p0

    move/from16 v2, p1

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    .line 595
    invoke-static/range {v1 .. v6}, Lde/robv/android/xposed/XposedBridge;->invokeOriginalMethodNative(Ljava/lang/reflect/Member;I[Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_37
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_28 .. :try_end_37} :catch_39

    move-result-object v1

    goto :goto_18

    .line 597
    :catch_39
    move-exception v12

    .line 598
    .restart local v12    # "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v12}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    throw v1

    .line 602
    .end local v12    # "e":Ljava/lang/reflect/InvocationTargetException;
    :cond_3f
    new-instance v15, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;

    invoke-direct {v15}, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;-><init>()V

    .line 603
    .local v15, "param":Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;
    move-object/from16 v0, p0

    iput-object v0, v15, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->method:Ljava/lang/reflect/Member;

    .line 604
    move-object/from16 v0, p3

    iput-object v0, v15, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    .line 605
    move-object/from16 v0, p4

    iput-object v0, v15, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    .line 608
    const/4 v9, 0x0

    .line 611
    .local v9, "beforeIdx":I
    :cond_51
    :try_start_51
    aget-object v1, v11, v9

    check-cast v1, Lde/robv/android/xposed/XC_MethodHook;

    invoke-virtual {v1, v15}, Lde/robv/android/xposed/XC_MethodHook;->beforeHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    :try_end_58
    .catch Ljava/lang/Throwable; {:try_start_51 .. :try_end_58} :catch_95

    .line 621
    iget-boolean v1, v15, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->returnEarly:Z

    if-eqz v1, :cond_a0

    .line 623
    add-int/lit8 v9, v9, 0x1

    .line 629
    :goto_5e
    iget-boolean v1, v15, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->returnEarly:Z

    if-nez v1, :cond_75

    .line 632
    :try_start_62
    iget-object v3, v7, Lde/robv/android/xposed/XposedBridge$AdditionalHookInfo;->parameterTypes:[Ljava/lang/Class;

    iget-object v4, v7, Lde/robv/android/xposed/XposedBridge$AdditionalHookInfo;->returnType:Ljava/lang/Class;

    iget-object v5, v15, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    iget-object v6, v15, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    move-object/from16 v1, p0

    move/from16 v2, p1

    .line 631
    invoke-static/range {v1 .. v6}, Lde/robv/android/xposed/XposedBridge;->invokeOriginalMethodNative(Ljava/lang/reflect/Member;I[Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v15, v1}, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->setResult(Ljava/lang/Object;)V
    :try_end_75
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_62 .. :try_end_75} :catch_a5

    .line 639
    :cond_75
    :goto_75
    add-int/lit8 v8, v9, -0x1

    .line 641
    .local v8, "afterIdx":I
    :cond_77
    invoke-virtual {v15}, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->getResult()Ljava/lang/Object;

    move-result-object v13

    .line 642
    .local v13, "lastResult":Ljava/lang/Object;
    invoke-virtual {v15}, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->getThrowable()Ljava/lang/Throwable;

    move-result-object v14

    .line 645
    .local v14, "lastThrowable":Ljava/lang/Throwable;
    :try_start_7f
    aget-object v1, v11, v8

    check-cast v1, Lde/robv/android/xposed/XC_MethodHook;

    invoke-virtual {v1, v15}, Lde/robv/android/xposed/XC_MethodHook;->afterHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    :try_end_86
    .catch Ljava/lang/Throwable; {:try_start_7f .. :try_end_86} :catch_ae

    .line 655
    :goto_86
    add-int/lit8 v8, v8, -0x1

    .line 640
    if-gez v8, :cond_77

    .line 658
    invoke-virtual {v15}, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->hasThrowable()Z

    move-result v1

    if-eqz v1, :cond_bc

    .line 659
    invoke-virtual {v15}, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->getThrowable()Ljava/lang/Throwable;

    move-result-object v1

    throw v1

    .line 612
    .end local v8    # "afterIdx":I
    .end local v13    # "lastResult":Ljava/lang/Object;
    .end local v14    # "lastThrowable":Ljava/lang/Throwable;
    :catch_95
    move-exception v16

    .line 613
    .local v16, "t":Ljava/lang/Throwable;
    invoke-static/range {v16 .. v16}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 616
    const/4 v1, 0x0

    invoke-virtual {v15, v1}, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->setResult(Ljava/lang/Object;)V

    .line 617
    const/4 v1, 0x0

    iput-boolean v1, v15, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->returnEarly:Z

    .line 626
    .end local v16    # "t":Ljava/lang/Throwable;
    :cond_a0
    add-int/lit8 v9, v9, 0x1

    .line 609
    if-lt v9, v10, :cond_51

    goto :goto_5e

    .line 633
    :catch_a5
    move-exception v12

    .line 634
    .restart local v12    # "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v12}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    invoke-virtual {v15, v1}, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->setThrowable(Ljava/lang/Throwable;)V

    goto :goto_75

    .line 646
    .end local v12    # "e":Ljava/lang/reflect/InvocationTargetException;
    .restart local v8    # "afterIdx":I
    .restart local v13    # "lastResult":Ljava/lang/Object;
    .restart local v14    # "lastThrowable":Ljava/lang/Throwable;
    :catch_ae
    move-exception v16

    .line 647
    .restart local v16    # "t":Ljava/lang/Throwable;
    invoke-static/range {v16 .. v16}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 650
    if-nez v14, :cond_b8

    .line 651
    invoke-virtual {v15, v13}, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->setResult(Ljava/lang/Object;)V

    goto :goto_86

    .line 653
    :cond_b8
    invoke-virtual {v15, v14}, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->setThrowable(Ljava/lang/Throwable;)V

    goto :goto_86

    .line 661
    .end local v16    # "t":Ljava/lang/Throwable;
    :cond_bc
    invoke-virtual {v15}, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->getResult()Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_18
.end method

.method public static hookAllConstructors(Ljava/lang/Class;Lde/robv/android/xposed/XC_MethodHook;)Ljava/util/Set;
    .registers 8
    .param p1, "callback"    # Lde/robv/android/xposed/XC_MethodHook;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lde/robv/android/xposed/XC_MethodHook;",
            ")",
            "Ljava/util/Set",
            "<",
            "Lde/robv/android/xposed/XC_MethodHook$Unhook;",
            ">;"
        }
    .end annotation

    .prologue
    .line 569
    .local p0, "hookClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 570
    .local v1, "unhooks":Ljava/util/Set;, "Ljava/util/Set<Lde/robv/android/xposed/XC_MethodHook$Unhook;>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v3

    array-length v4, v3

    const/4 v2, 0x0

    :goto_b
    if-lt v2, v4, :cond_e

    .line 572
    return-object v1

    .line 570
    :cond_e
    aget-object v0, v3, v2

    .line 571
    .local v0, "constructor":Ljava/lang/reflect/Member;
    invoke-static {v0, p1}, Lde/robv/android/xposed/XposedBridge;->hookMethod(Ljava/lang/reflect/Member;Lde/robv/android/xposed/XC_MethodHook;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 570
    add-int/lit8 v2, v2, 0x1

    goto :goto_b
.end method

.method public static hookAllMethods(Ljava/lang/Class;Ljava/lang/String;Lde/robv/android/xposed/XC_MethodHook;)Ljava/util/Set;
    .registers 9
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "callback"    # Lde/robv/android/xposed/XC_MethodHook;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Lde/robv/android/xposed/XC_MethodHook;",
            ")",
            "Ljava/util/Set",
            "<",
            "Lde/robv/android/xposed/XC_MethodHook$Unhook;",
            ">;"
        }
    .end annotation

    .prologue
    .line 561
    .local p0, "hookClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 562
    .local v1, "unhooks":Ljava/util/Set;, "Ljava/util/Set<Lde/robv/android/xposed/XC_MethodHook$Unhook;>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v3

    array-length v4, v3

    const/4 v2, 0x0

    :goto_b
    if-lt v2, v4, :cond_e

    .line 565
    return-object v1

    .line 562
    :cond_e
    aget-object v0, v3, v2

    .line 563
    .local v0, "method":Ljava/lang/reflect/Member;
    invoke-interface {v0}, Ljava/lang/reflect/Member;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_21

    .line 564
    invoke-static {v0, p2}, Lde/robv/android/xposed/XposedBridge;->hookMethod(Ljava/lang/reflect/Member;Lde/robv/android/xposed/XC_MethodHook;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 562
    :cond_21
    add-int/lit8 v2, v2, 0x1

    goto :goto_b
.end method

.method public static hookInitPackageResources(Lde/robv/android/xposed/callbacks/XC_InitPackageResources;)Lde/robv/android/xposed/callbacks/XC_InitPackageResources$Unhook;
    .registers 3
    .param p0, "callback"    # Lde/robv/android/xposed/callbacks/XC_InitPackageResources;

    .prologue
    .line 685
    sget-object v1, Lde/robv/android/xposed/XposedBridge;->sInitPackageResourcesCallbacks:Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    monitor-enter v1

    .line 686
    :try_start_3
    sget-object v0, Lde/robv/android/xposed/XposedBridge;->sInitPackageResourcesCallbacks:Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    invoke-virtual {v0, p0}, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;->add(Ljava/lang/Object;)Z

    .line 685
    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_12

    .line 688
    new-instance v0, Lde/robv/android/xposed/callbacks/XC_InitPackageResources$Unhook;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v0, p0}, Lde/robv/android/xposed/callbacks/XC_InitPackageResources$Unhook;-><init>(Lde/robv/android/xposed/callbacks/XC_InitPackageResources;)V

    return-object v0

    .line 685
    :catchall_12
    move-exception v0

    :try_start_13
    monitor-exit v1
    :try_end_14
    .catchall {:try_start_13 .. :try_end_14} :catchall_12

    throw v0
.end method

.method public static hookLoadPackage(Lde/robv/android/xposed/callbacks/XC_LoadPackage;)Lde/robv/android/xposed/callbacks/XC_LoadPackage$Unhook;
    .registers 3
    .param p0, "callback"    # Lde/robv/android/xposed/callbacks/XC_LoadPackage;

    .prologue
    .line 668
    sget-object v1, Lde/robv/android/xposed/XposedBridge;->sLoadedPackageCallbacks:Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    monitor-enter v1

    .line 669
    :try_start_3
    sget-object v0, Lde/robv/android/xposed/XposedBridge;->sLoadedPackageCallbacks:Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    invoke-virtual {v0, p0}, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;->add(Ljava/lang/Object;)Z

    .line 668
    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_12

    .line 671
    new-instance v0, Lde/robv/android/xposed/callbacks/XC_LoadPackage$Unhook;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v0, p0}, Lde/robv/android/xposed/callbacks/XC_LoadPackage$Unhook;-><init>(Lde/robv/android/xposed/callbacks/XC_LoadPackage;)V

    return-object v0

    .line 668
    :catchall_12
    move-exception v0

    :try_start_13
    monitor-exit v1
    :try_end_14
    .catchall {:try_start_13 .. :try_end_14} :catchall_12

    throw v0
.end method

.method public static hookMethod(Ljava/lang/reflect/Member;Lde/robv/android/xposed/XC_MethodHook;)Lde/robv/android/xposed/XC_MethodHook$Unhook;
    .registers 12
    .param p0, "hookMethod"    # Ljava/lang/reflect/Member;
    .param p1, "callback"    # Lde/robv/android/xposed/XC_MethodHook;

    .prologue
    .line 505
    instance-of v7, p0, Ljava/lang/reflect/Method;

    if-nez v7, :cond_21

    instance-of v7, p0, Ljava/lang/reflect/Constructor;

    if-nez v7, :cond_21

    .line 506
    new-instance v7, Ljava/lang/IllegalArgumentException;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Only methods and constructors can be hooked: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 507
    :cond_21
    invoke-interface {p0}, Ljava/lang/reflect/Member;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->isInterface()Z

    move-result v7

    if-eqz v7, :cond_44

    .line 508
    new-instance v7, Ljava/lang/IllegalArgumentException;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Cannot hook interfaces: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 509
    :cond_44
    invoke-interface {p0}, Ljava/lang/reflect/Member;->getModifiers()I

    move-result v7

    invoke-static {v7}, Ljava/lang/reflect/Modifier;->isAbstract(I)Z

    move-result v7

    if-eqz v7, :cond_67

    .line 510
    new-instance v7, Ljava/lang/IllegalArgumentException;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Cannot hook abstract methods: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 513
    :cond_67
    const/4 v3, 0x0

    .line 515
    .local v3, "newMethod":Z
    sget-object v8, Lde/robv/android/xposed/XposedBridge;->sHookedMethodCallbacks:Ljava/util/Map;

    monitor-enter v8

    .line 516
    :try_start_6b
    sget-object v7, Lde/robv/android/xposed/XposedBridge;->sHookedMethodCallbacks:Ljava/util/Map;

    invoke-interface {v7, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    .line 517
    .local v1, "callbacks":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/XC_MethodHook;>;"
    if-nez v1, :cond_80

    .line 518
    new-instance v1, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    .end local v1    # "callbacks":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/XC_MethodHook;>;"
    invoke-direct {v1}, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;-><init>()V

    .line 519
    .restart local v1    # "callbacks":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/XC_MethodHook;>;"
    sget-object v7, Lde/robv/android/xposed/XposedBridge;->sHookedMethodCallbacks:Ljava/util/Map;

    invoke-interface {v7, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 520
    const/4 v3, 0x1

    .line 515
    :cond_80
    monitor-exit v8
    :try_end_81
    .catchall {:try_start_6b .. :try_end_81} :catchall_b4

    .line 523
    invoke-virtual {v1, p1}, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;->add(Ljava/lang/Object;)Z

    .line 524
    if-eqz v3, :cond_ab

    .line 525
    invoke-interface {p0}, Ljava/lang/reflect/Member;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v2

    .line 526
    .local v2, "declaringClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v7, "slot"

    invoke-static {p0, v7}, Lde/robv/android/xposed/XposedHelpers;->getIntField(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v6

    .line 530
    .local v6, "slot":I
    instance-of v7, p0, Ljava/lang/reflect/Method;

    if-eqz v7, :cond_b7

    move-object v7, p0

    .line 531
    check-cast v7, Ljava/lang/reflect/Method;

    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v4

    .local v4, "parameterTypes":[Ljava/lang/Class;
    move-object v7, p0

    .line 532
    check-cast v7, Ljava/lang/reflect/Method;

    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v5

    .line 538
    .local v5, "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_a2
    new-instance v0, Lde/robv/android/xposed/XposedBridge$AdditionalHookInfo;

    const/4 v7, 0x0

    invoke-direct {v0, v1, v4, v5, v7}, Lde/robv/android/xposed/XposedBridge$AdditionalHookInfo;-><init>(Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;[Ljava/lang/Class;Ljava/lang/Class;Lde/robv/android/xposed/XposedBridge$AdditionalHookInfo;)V

    .line 539
    .local v0, "additionalInfo":Lde/robv/android/xposed/XposedBridge$AdditionalHookInfo;
    invoke-static {p0, v2, v6, v0}, Lde/robv/android/xposed/XposedBridge;->hookMethodNative(Ljava/lang/reflect/Member;Ljava/lang/Class;ILjava/lang/Object;)V

    .line 542
    .end local v0    # "additionalInfo":Lde/robv/android/xposed/XposedBridge$AdditionalHookInfo;
    .end local v2    # "declaringClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "parameterTypes":[Ljava/lang/Class;
    .end local v5    # "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v6    # "slot":I
    :cond_ab
    new-instance v7, Lde/robv/android/xposed/XC_MethodHook$Unhook;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v7, p1, p0}, Lde/robv/android/xposed/XC_MethodHook$Unhook;-><init>(Lde/robv/android/xposed/XC_MethodHook;Ljava/lang/reflect/Member;)V

    return-object v7

    .line 515
    .end local v1    # "callbacks":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/XC_MethodHook;>;"
    :catchall_b4
    move-exception v7

    :try_start_b5
    monitor-exit v8
    :try_end_b6
    .catchall {:try_start_b5 .. :try_end_b6} :catchall_b4

    throw v7

    .restart local v1    # "callbacks":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/XC_MethodHook;>;"
    .restart local v2    # "declaringClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v6    # "slot":I
    :cond_b7
    move-object v7, p0

    .line 534
    check-cast v7, Ljava/lang/reflect/Constructor;

    invoke-virtual {v7}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v4

    .line 535
    .restart local v4    # "parameterTypes":[Ljava/lang/Class;
    const/4 v5, 0x0

    .restart local v5    # "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    goto :goto_a2
.end method

.method private static synchronized native declared-synchronized hookMethodNative(Ljava/lang/Class;I)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;I)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method private static synchronized native declared-synchronized hookMethodNative(Ljava/lang/reflect/Member;Ljava/lang/Class;ILjava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Member;",
            "Ljava/lang/Class",
            "<*>;I",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation
.end method

.method private static hookResources()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 285
    new-instance v2, Ljava/lang/ThreadLocal;

    invoke-direct {v2}, Ljava/lang/ThreadLocal;-><init>()V

    .line 287
    .local v2, "latestResKey":Ljava/lang/ThreadLocal;, "Ljava/lang/ThreadLocal<Ljava/lang/Object;>;"
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x12

    if-gt v4, v5, :cond_4a

    .line 288
    const-class v0, Landroid/app/ActivityThread;

    .line 289
    .local v0, "classGTLR":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v4, "android.app.ActivityThread$ResourcesKey"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 295
    .local v1, "classResKey":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_13
    new-instance v4, Lde/robv/android/xposed/XposedBridge$5;

    invoke-direct {v4, v2}, Lde/robv/android/xposed/XposedBridge$5;-><init>(Ljava/lang/ThreadLocal;)V

    invoke-static {v1, v4}, Lde/robv/android/xposed/XposedBridge;->hookAllConstructors(Ljava/lang/Class;Lde/robv/android/xposed/XC_MethodHook;)Ljava/util/Set;

    .line 302
    const-string v4, "getTopLevelResources"

    new-instance v5, Lde/robv/android/xposed/XposedBridge$6;

    invoke-direct {v5, v2}, Lde/robv/android/xposed/XposedBridge$6;-><init>(Ljava/lang/ThreadLocal;)V

    invoke-static {v0, v4, v5}, Lde/robv/android/xposed/XposedBridge;->hookAllMethods(Ljava/lang/Class;Ljava/lang/String;Lde/robv/android/xposed/XC_MethodHook;)Ljava/util/Set;

    .line 352
    const-class v4, Landroid/content/res/TypedArray;

    new-instance v5, Lde/robv/android/xposed/XposedBridge$7;

    invoke-direct {v5}, Lde/robv/android/xposed/XposedBridge$7;-><init>()V

    invoke-static {v4, v5}, Lde/robv/android/xposed/XposedBridge;->hookAllConstructors(Ljava/lang/Class;Lde/robv/android/xposed/XC_MethodHook;)Ljava/util/Set;

    .line 365
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v4

    const-class v5, Landroid/content/res/XResources;

    invoke-static {v4, v5}, Lde/robv/android/xposed/XposedBridge;->cloneToSubclass(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/res/XResources;

    .line 366
    .local v3, "systemRes":Landroid/content/res/XResources;
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/content/res/XResources;->initObject(Ljava/lang/String;)V

    .line 367
    const-class v4, Landroid/content/res/Resources;

    const-string v5, "mSystem"

    invoke-static {v4, v5, v3}, Lde/robv/android/xposed/XposedHelpers;->setStaticObjectField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V

    .line 369
    invoke-static {v2}, Landroid/content/res/XResources;->init(Ljava/lang/ThreadLocal;)V

    .line 370
    return-void

    .line 291
    .end local v0    # "classGTLR":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "classResKey":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "systemRes":Landroid/content/res/XResources;
    :cond_4a
    const-string v4, "android.app.ResourcesManager"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 292
    .restart local v0    # "classGTLR":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v4, "android.content.res.ResourcesKey"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .restart local v1    # "classResKey":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    goto :goto_13
.end method

.method private static hookXposedInstaller(Ljava/lang/ClassLoader;)V
    .registers 7
    .param p0, "classLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 374
    :try_start_0
    const-string v1, "de.robv.android.xposed.installer.XposedApp"

    const-string v2, "getActiveXposedVersion"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    .line 375
    sget v5, Lde/robv/android/xposed/XposedBridge;->XPOSED_BRIDGE_VERSION:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v5}, Lde/robv/android/xposed/XC_MethodReplacement;->returnConstant(Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodReplacement;

    move-result-object v5

    aput-object v5, v3, v4

    .line 374
    invoke-static {v1, p0, v2, v3}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;
    :try_end_17
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_17} :catch_18

    .line 377
    :goto_17
    return-void

    .line 376
    :catch_18
    move-exception v0

    .local v0, "t":Ljava/lang/Throwable;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    goto :goto_17
.end method

.method private static native initNative()Z
.end method

.method private static initXbridgeZygote()V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x2

    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 180
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, v5}, Ljava/util/HashSet;-><init>(I)V

    .line 183
    .local v0, "loadedPackagesInProcess":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    const-class v1, Landroid/app/ActivityThread;

    const-string v2, "handleBindApplication"

    new-array v3, v7, [Ljava/lang/Object;

    const-string v4, "android.app.ActivityThread.AppBindData"

    aput-object v4, v3, v6

    new-instance v4, Lde/robv/android/xposed/XposedBridge$1;

    invoke-direct {v4, v0}, Lde/robv/android/xposed/XposedBridge$1;-><init>(Ljava/util/HashSet;)V

    aput-object v4, v3, v5

    invoke-static {v1, v2, v3}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    .line 216
    const-string v2, "com.android.server.ServerThread"

    .line 217
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x13

    if-ge v1, v3, :cond_62

    const-string v1, "run"

    :goto_27
    new-array v3, v5, [Ljava/lang/Object;

    new-instance v4, Lde/robv/android/xposed/XposedBridge$2;

    invoke-direct {v4, v0}, Lde/robv/android/xposed/XposedBridge$2;-><init>(Ljava/util/HashSet;)V

    aput-object v4, v3, v6

    .line 216
    invoke-static {v2, v8, v1, v3}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    .line 233
    const-class v1, Landroid/app/LoadedApk;

    new-instance v2, Lde/robv/android/xposed/XposedBridge$3;

    invoke-direct {v2, v0}, Lde/robv/android/xposed/XposedBridge$3;-><init>(Ljava/util/HashSet;)V

    invoke-static {v1, v2}, Lde/robv/android/xposed/XposedBridge;->hookAllConstructors(Ljava/lang/Class;Lde/robv/android/xposed/XC_MethodHook;)Ljava/util/Set;

    .line 256
    const-string v1, "android.app.ApplicationPackageManager"

    const-string v2, "getResourcesForApplication"

    new-array v3, v7, [Ljava/lang/Object;

    .line 257
    const-class v4, Landroid/content/pm/ApplicationInfo;

    aput-object v4, v3, v6

    new-instance v4, Lde/robv/android/xposed/XposedBridge$4;

    invoke-direct {v4}, Lde/robv/android/xposed/XposedBridge$4;-><init>()V

    aput-object v4, v3, v5

    .line 256
    invoke-static {v1, v8, v2, v3}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    .line 266
    new-instance v1, Ljava/io/File;

    const-string v2, "/data/data/de.robv.android.xposed.installer/conf/disable_resources"

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_65

    .line 267
    invoke-static {}, Lde/robv/android/xposed/XposedBridge;->hookResources()V

    .line 271
    :goto_61
    return-void

    .line 217
    :cond_62
    const-string v1, "initAndLoop"

    goto :goto_27

    .line 269
    :cond_65
    sput-boolean v5, Lde/robv/android/xposed/XposedBridge;->disableResources:Z

    goto :goto_61
.end method

.method public static invokeOriginalMethod(Ljava/lang/reflect/Member;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9
    .param p0, "method"    # Ljava/lang/reflect/Member;
    .param p1, "thisObject"    # Ljava/lang/Object;
    .param p2, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NullPointerException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 739
    if-nez p2, :cond_4

    .line 740
    sget-object p2, Lde/robv/android/xposed/XposedBridge;->EMPTY_ARRAY:[Ljava/lang/Object;

    .line 745
    :cond_4
    instance-of v0, p0, Ljava/lang/reflect/Method;

    if-eqz v0, :cond_1f

    move-object v0, p0

    .line 746
    check-cast v0, Ljava/lang/reflect/Method;

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v2

    .local v2, "parameterTypes":[Ljava/lang/Class;
    move-object v0, p0

    .line 747
    check-cast v0, Ljava/lang/reflect/Method;

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v3

    .line 755
    .local v3, "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_16
    const/4 v1, 0x0

    move-object v0, p0

    move-object v4, p1

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Lde/robv/android/xposed/XposedBridge;->invokeOriginalMethodNative(Ljava/lang/reflect/Member;I[Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 748
    .end local v2    # "parameterTypes":[Ljava/lang/Class;
    .end local v3    # "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_1f
    instance-of v0, p0, Ljava/lang/reflect/Constructor;

    if-eqz v0, :cond_2c

    move-object v0, p0

    .line 749
    check-cast v0, Ljava/lang/reflect/Constructor;

    invoke-virtual {v0}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v2

    .line 750
    .restart local v2    # "parameterTypes":[Ljava/lang/Class;
    const/4 v3, 0x0

    .line 751
    .restart local v3    # "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    goto :goto_16

    .line 752
    .end local v2    # "parameterTypes":[Ljava/lang/Class;
    .end local v3    # "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "method must be of type Method or Constructor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static native invokeOriginalMethodNative(Ljava/lang/reflect/Member;I[Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Member;",
            "I[",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation
.end method

.method private static native invokeOriginalMethodNative(Ljava/lang/reflect/Member;[Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Member;",
            "[",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method private static loadModule(Ljava/lang/String;Ljava/lang/String;)V
    .registers 14
    .param p0, "apk"    # Ljava/lang/String;
    .param p1, "startClassName"    # Ljava/lang/String;

    .prologue
    .line 397
    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "Loading modules from "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    .line 399
    new-instance v10, Ljava/io/File;

    invoke-direct {v10, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v10

    if-nez v10, :cond_23

    .line 400
    const-string v10, "  File does not exist"

    invoke-static {v10}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    .line 464
    :goto_22
    return-void

    .line 404
    :cond_23
    new-instance v3, Ldalvik/system/PathClassLoader;

    sget-object v10, Lde/robv/android/xposed/XposedBridge;->BOOTCLASSLOADER:Ljava/lang/ClassLoader;

    invoke-direct {v3, p0, v10}, Ldalvik/system/PathClassLoader;-><init>(Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 405
    .local v3, "mcl":Ljava/lang/ClassLoader;
    const-string v10, "assets/xposed_init"

    invoke-virtual {v3, v10}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 406
    .local v2, "is":Ljava/io/InputStream;
    if-nez v2, :cond_38

    .line 407
    const-string v10, "assets/xposed_init not found in the APK"

    invoke-static {v10}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    goto :goto_22

    .line 411
    :cond_38
    new-instance v6, Ljava/io/BufferedReader;

    new-instance v10, Ljava/io/InputStreamReader;

    invoke-direct {v10, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v6, v10}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 414
    .local v6, "moduleClassesReader":Ljava/io/BufferedReader;
    :cond_42
    :goto_42
    :try_start_42
    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_45
    .catch Ljava/io/IOException; {:try_start_42 .. :try_end_45} :catch_89
    .catchall {:try_start_42 .. :try_end_45} :catchall_a5

    move-result-object v5

    .local v5, "moduleClassName":Ljava/lang/String;
    if-nez v5, :cond_4e

    .line 461
    :try_start_48
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_4b
    .catch Ljava/io/IOException; {:try_start_48 .. :try_end_4b} :catch_4c

    goto :goto_22

    .line 462
    :catch_4c
    move-exception v10

    goto :goto_22

    .line 415
    :cond_4e
    :try_start_4e
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 416
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_42

    const-string v10, "#"

    invoke-virtual {v5, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    :try_end_5d
    .catch Ljava/io/IOException; {:try_start_4e .. :try_end_5d} :catch_89
    .catchall {:try_start_4e .. :try_end_5d} :catchall_a5

    move-result v10

    if-nez v10, :cond_42

    .line 420
    :try_start_60
    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "  Loading class "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    .line 421
    invoke-virtual {v3, v5}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 423
    .local v4, "moduleClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v10, Lde/robv/android/xposed/IXposedMod;

    invoke-virtual {v10, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v10

    if-nez v10, :cond_93

    .line 424
    const-string v10, "    This class doesn\'t implement any sub-interface of IXposedMod, skipping it"

    invoke-static {v10}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V
    :try_end_83
    .catch Ljava/lang/Throwable; {:try_start_60 .. :try_end_83} :catch_84
    .catch Ljava/io/IOException; {:try_start_60 .. :try_end_83} :catch_89
    .catchall {:try_start_60 .. :try_end_83} :catchall_a5

    goto :goto_42

    .line 453
    .end local v4    # "moduleClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_84
    move-exception v9

    .line 454
    .local v9, "t":Ljava/lang/Throwable;
    :try_start_85
    invoke-static {v9}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V
    :try_end_88
    .catch Ljava/io/IOException; {:try_start_85 .. :try_end_88} :catch_89
    .catchall {:try_start_85 .. :try_end_88} :catchall_a5

    goto :goto_42

    .line 457
    .end local v5    # "moduleClassName":Ljava/lang/String;
    .end local v9    # "t":Ljava/lang/Throwable;
    :catch_89
    move-exception v1

    .line 458
    .local v1, "e":Ljava/io/IOException;
    :try_start_8a
    invoke-static {v1}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V
    :try_end_8d
    .catchall {:try_start_8a .. :try_end_8d} :catchall_a5

    .line 461
    :try_start_8d
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_90
    .catch Ljava/io/IOException; {:try_start_8d .. :try_end_90} :catch_91

    goto :goto_22

    .line 462
    :catch_91
    move-exception v10

    goto :goto_22

    .line 426
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v4    # "moduleClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v5    # "moduleClassName":Ljava/lang/String;
    :cond_93
    :try_start_93
    sget-boolean v10, Lde/robv/android/xposed/XposedBridge;->disableResources:Z

    if-eqz v10, :cond_aa

    const-class v10, Lde/robv/android/xposed/IXposedHookInitPackageResources;

    invoke-virtual {v10, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v10

    if-eqz v10, :cond_aa

    .line 427
    const-string v10, "    This class requires resource-related hooks (which are disabled), skipping it."

    invoke-static {v10}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V
    :try_end_a4
    .catch Ljava/lang/Throwable; {:try_start_93 .. :try_end_a4} :catch_84
    .catch Ljava/io/IOException; {:try_start_93 .. :try_end_a4} :catch_89
    .catchall {:try_start_93 .. :try_end_a4} :catchall_a5

    goto :goto_42

    .line 459
    .end local v4    # "moduleClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v5    # "moduleClassName":Ljava/lang/String;
    :catchall_a5
    move-exception v10

    .line 461
    :try_start_a6
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_a9
    .catch Ljava/io/IOException; {:try_start_a6 .. :try_end_a9} :catch_f6

    .line 463
    :goto_a9
    throw v10

    .line 432
    .restart local v4    # "moduleClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v5    # "moduleClassName":Ljava/lang/String;
    :cond_aa
    :try_start_aa
    invoke-virtual {v4}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v7

    .line 433
    .local v7, "moduleInstance":Ljava/lang/Object;
    if-nez p1, :cond_e2

    .line 434
    instance-of v10, v7, Lde/robv/android/xposed/IXposedHookZygoteInit;

    if-eqz v10, :cond_c2

    .line 435
    new-instance v8, Lde/robv/android/xposed/IXposedHookZygoteInit$StartupParam;

    invoke-direct {v8}, Lde/robv/android/xposed/IXposedHookZygoteInit$StartupParam;-><init>()V

    .line 436
    .local v8, "param":Lde/robv/android/xposed/IXposedHookZygoteInit$StartupParam;
    iput-object p0, v8, Lde/robv/android/xposed/IXposedHookZygoteInit$StartupParam;->modulePath:Ljava/lang/String;

    .line 437
    move-object v0, v7

    check-cast v0, Lde/robv/android/xposed/IXposedHookZygoteInit;

    move-object v10, v0

    invoke-interface {v10, v8}, Lde/robv/android/xposed/IXposedHookZygoteInit;->initZygote(Lde/robv/android/xposed/IXposedHookZygoteInit$StartupParam;)V

    .line 440
    .end local v8    # "param":Lde/robv/android/xposed/IXposedHookZygoteInit$StartupParam;
    :cond_c2
    instance-of v10, v7, Lde/robv/android/xposed/IXposedHookLoadPackage;

    if-eqz v10, :cond_d2

    .line 441
    new-instance v11, Lde/robv/android/xposed/IXposedHookLoadPackage$Wrapper;

    move-object v0, v7

    check-cast v0, Lde/robv/android/xposed/IXposedHookLoadPackage;

    move-object v10, v0

    invoke-direct {v11, v10}, Lde/robv/android/xposed/IXposedHookLoadPackage$Wrapper;-><init>(Lde/robv/android/xposed/IXposedHookLoadPackage;)V

    invoke-static {v11}, Lde/robv/android/xposed/XposedBridge;->hookLoadPackage(Lde/robv/android/xposed/callbacks/XC_LoadPackage;)Lde/robv/android/xposed/callbacks/XC_LoadPackage$Unhook;

    .line 443
    :cond_d2
    instance-of v10, v7, Lde/robv/android/xposed/IXposedHookInitPackageResources;

    if-eqz v10, :cond_42

    .line 444
    new-instance v10, Lde/robv/android/xposed/IXposedHookInitPackageResources$Wrapper;

    check-cast v7, Lde/robv/android/xposed/IXposedHookInitPackageResources;

    .end local v7    # "moduleInstance":Ljava/lang/Object;
    invoke-direct {v10, v7}, Lde/robv/android/xposed/IXposedHookInitPackageResources$Wrapper;-><init>(Lde/robv/android/xposed/IXposedHookInitPackageResources;)V

    invoke-static {v10}, Lde/robv/android/xposed/XposedBridge;->hookInitPackageResources(Lde/robv/android/xposed/callbacks/XC_InitPackageResources;)Lde/robv/android/xposed/callbacks/XC_InitPackageResources$Unhook;

    goto/16 :goto_42

    .line 446
    .restart local v7    # "moduleInstance":Ljava/lang/Object;
    :cond_e2
    instance-of v10, v7, Lde/robv/android/xposed/IXposedHookCmdInit;

    if-eqz v10, :cond_42

    .line 447
    new-instance v8, Lde/robv/android/xposed/IXposedHookCmdInit$StartupParam;

    invoke-direct {v8}, Lde/robv/android/xposed/IXposedHookCmdInit$StartupParam;-><init>()V

    .line 448
    .local v8, "param":Lde/robv/android/xposed/IXposedHookCmdInit$StartupParam;
    iput-object p0, v8, Lde/robv/android/xposed/IXposedHookCmdInit$StartupParam;->modulePath:Ljava/lang/String;

    .line 449
    iput-object p1, v8, Lde/robv/android/xposed/IXposedHookCmdInit$StartupParam;->startClassName:Ljava/lang/String;

    .line 450
    check-cast v7, Lde/robv/android/xposed/IXposedHookCmdInit;

    .end local v7    # "moduleInstance":Ljava/lang/Object;
    invoke-interface {v7, v8}, Lde/robv/android/xposed/IXposedHookCmdInit;->initCmdApp(Lde/robv/android/xposed/IXposedHookCmdInit$StartupParam;)V
    :try_end_f4
    .catch Ljava/lang/Throwable; {:try_start_aa .. :try_end_f4} :catch_84
    .catch Ljava/io/IOException; {:try_start_aa .. :try_end_f4} :catch_89
    .catchall {:try_start_aa .. :try_end_f4} :catchall_a5

    goto/16 :goto_42

    .line 462
    .end local v4    # "moduleClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v5    # "moduleClassName":Ljava/lang/String;
    .end local v8    # "param":Lde/robv/android/xposed/IXposedHookCmdInit$StartupParam;
    :catch_f6
    move-exception v11

    goto :goto_a9
.end method

.method private static loadModules(Ljava/lang/String;)V
    .registers 5
    .param p0, "startClassName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 383
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/FileReader;

    const-string v3, "/data/data/de.robv.android.xposed.installer/conf/modules.list"

    invoke-direct {v2, v3}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 385
    .local v1, "apks":Ljava/io/BufferedReader;
    :goto_c
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .local v0, "apk":Ljava/lang/String;
    if-nez v0, :cond_16

    .line 388
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 389
    return-void

    .line 386
    :cond_16
    invoke-static {v0, p0}, Lde/robv/android/xposed/XposedBridge;->loadModule(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_c
.end method

.method public static declared-synchronized log(Ljava/lang/String;)V
    .registers 3
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 475
    const-class v1, Lde/robv/android/xposed/XposedBridge;

    monitor-enter v1

    :try_start_3
    const-string v0, "Xposed"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 476
    sget-object v0, Lde/robv/android/xposed/XposedBridge;->logWriter:Ljava/io/PrintWriter;

    if-eqz v0, :cond_16

    .line 477
    sget-object v0, Lde/robv/android/xposed/XposedBridge;->logWriter:Ljava/io/PrintWriter;

    invoke-virtual {v0, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 478
    sget-object v0, Lde/robv/android/xposed/XposedBridge;->logWriter:Ljava/io/PrintWriter;

    invoke-virtual {v0}, Ljava/io/PrintWriter;->flush()V
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_18

    .line 480
    :cond_16
    monitor-exit v1

    return-void

    .line 475
    :catchall_18
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized log(Ljava/lang/Throwable;)V
    .registers 4
    .param p0, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 491
    const-class v1, Lde/robv/android/xposed/XposedBridge;

    monitor-enter v1

    :try_start_3
    const-string v0, "Xposed"

    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 492
    sget-object v0, Lde/robv/android/xposed/XposedBridge;->logWriter:Ljava/io/PrintWriter;

    if-eqz v0, :cond_1a

    .line 493
    sget-object v0, Lde/robv/android/xposed/XposedBridge;->logWriter:Ljava/io/PrintWriter;

    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 494
    sget-object v0, Lde/robv/android/xposed/XposedBridge;->logWriter:Ljava/io/PrintWriter;

    invoke-virtual {v0}, Ljava/io/PrintWriter;->flush()V
    :try_end_1a
    .catchall {:try_start_3 .. :try_end_1a} :catchall_1c

    .line 496
    :cond_1a
    monitor-exit v1

    return-void

    .line 491
    :catchall_1c
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static main([Ljava/lang/String;)V
    .registers 10
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    const/4 v8, 0x1

    .line 90
    invoke-static {}, Lde/robv/android/xposed/XposedBridge;->getStartClassName()Ljava/lang/String;

    move-result-object v2

    .line 96
    .local v2, "startClassName":Ljava/lang/String;
    :try_start_5
    new-instance v1, Ljava/io/File;

    const-string v4, "/data/data/de.robv.android.xposed.installer/log/error.log"

    invoke-direct {v1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 97
    .local v1, "logFile":Ljava/io/File;
    if-nez v2, :cond_22

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v4

    const-wide/16 v6, 0x5000

    cmp-long v4, v4, v6

    if-lez v4, :cond_22

    .line 98
    new-instance v4, Ljava/io/File;

    const-string v5, "/data/data/de.robv.android.xposed.installer/log/error.log.old"

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v4}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 99
    :cond_22
    new-instance v4, Ljava/io/PrintWriter;

    new-instance v5, Ljava/io/FileWriter;

    const/4 v6, 0x1

    invoke-direct {v5, v1, v6}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    invoke-direct {v4, v5}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    sput-object v4, Lde/robv/android/xposed/XposedBridge;->logWriter:Ljava/io/PrintWriter;

    .line 100
    const/4 v4, 0x1

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v5}, Ljava/io/File;->setReadable(ZZ)Z

    .line 101
    const/4 v4, 0x1

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v5}, Ljava/io/File;->setWritable(ZZ)Z
    :try_end_39
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_39} :catch_d5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_39} :catch_c5

    .line 104
    .end local v1    # "logFile":Ljava/io/File;
    :goto_39
    :try_start_39
    invoke-static {}, Ljava/text/DateFormat;->getDateTimeInstance()Ljava/text/DateFormat;

    move-result-object v4

    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    invoke-virtual {v4, v5}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 105
    .local v0, "date":Ljava/lang/String;
    invoke-static {}, Lde/robv/android/xposed/XposedBridge;->determineXposedVersion()V

    .line 106
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "-----------------\n"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " UTC\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 107
    const-string v5, "Loading Xposed v"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget v5, Lde/robv/android/xposed/XposedBridge;->XPOSED_BRIDGE_VERSION:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 108
    const-string v5, " (for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    if-nez v2, :cond_bd

    const-string v4, "Zygote"

    :goto_70
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")..."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 106
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    .line 109
    if-nez v2, :cond_a9

    .line 111
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Running ROM \'"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\' with fingerprint \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    .line 114
    :cond_a9
    invoke-static {}, Lde/robv/android/xposed/XposedBridge;->initNative()Z

    move-result v4

    if-eqz v4, :cond_bf

    .line 115
    if-nez v2, :cond_b4

    .line 117
    invoke-static {}, Lde/robv/android/xposed/XposedBridge;->initXbridgeZygote()V

    .line 120
    :cond_b4
    invoke-static {v2}, Lde/robv/android/xposed/XposedBridge;->loadModules(Ljava/lang/String;)V
    :try_end_b7
    .catch Ljava/lang/Throwable; {:try_start_39 .. :try_end_b7} :catch_c5

    .line 131
    .end local v0    # "date":Ljava/lang/String;
    :goto_b7
    if-nez v2, :cond_d1

    .line 132
    invoke-static {p0}, Lcom/android/internal/os/ZygoteInit;->main([Ljava/lang/String;)V

    .line 135
    :goto_bc
    return-void

    .restart local v0    # "date":Ljava/lang/String;
    :cond_bd
    move-object v4, v2

    .line 108
    goto :goto_70

    .line 122
    :cond_bf
    :try_start_bf
    const-string v4, "Errors during native Xposed initialization"

    invoke-static {v4}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V
    :try_end_c4
    .catch Ljava/lang/Throwable; {:try_start_bf .. :try_end_c4} :catch_c5

    goto :goto_b7

    .line 124
    .end local v0    # "date":Ljava/lang/String;
    :catch_c5
    move-exception v3

    .line 125
    .local v3, "t":Ljava/lang/Throwable;
    const-string v4, "Errors during Xposed initialization"

    invoke-static {v4}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    .line 126
    invoke-static {v3}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 127
    sput-boolean v8, Lde/robv/android/xposed/XposedBridge;->disableHooks:Z

    goto :goto_b7

    .line 134
    .end local v3    # "t":Ljava/lang/Throwable;
    :cond_d1
    invoke-static {p0}, Lcom/android/internal/os/RuntimeInit;->main([Ljava/lang/String;)V

    goto :goto_bc

    .line 102
    :catch_d5
    move-exception v4

    goto/16 :goto_39
.end method

.method private static setObjectClass(Ljava/lang/Object;Ljava/lang/Class;)V
    .registers 5
    .param p0, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 760
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p0, :cond_3

    .line 776
    :goto_2
    return-void

    .line 769
    :cond_3
    const-class v0, Landroid/content/res/XResources$XTypedArray;

    if-eq p1, v0, :cond_22

    .line 770
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Target class "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not allowed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 772
    :cond_22
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    if-eq v0, v1, :cond_4f

    .line 773
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Cannot transfer object from "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 775
    :cond_4f
    invoke-static {p0, p1}, Lde/robv/android/xposed/XposedBridge;->setObjectClassNative(Ljava/lang/Object;Ljava/lang/Class;)V

    goto :goto_2
.end method

.method private static native setObjectClassNative(Ljava/lang/Object;Ljava/lang/Class;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation
.end method

.method public static unhookInitPackageResources(Lde/robv/android/xposed/callbacks/XC_InitPackageResources;)V
    .registers 3
    .param p0, "callback"    # Lde/robv/android/xposed/callbacks/XC_InitPackageResources;

    .prologue
    .line 692
    sget-object v1, Lde/robv/android/xposed/XposedBridge;->sInitPackageResourcesCallbacks:Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    monitor-enter v1

    .line 693
    :try_start_3
    sget-object v0, Lde/robv/android/xposed/XposedBridge;->sInitPackageResourcesCallbacks:Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    invoke-virtual {v0, p0}, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;->remove(Ljava/lang/Object;)Z

    .line 692
    monitor-exit v1

    .line 695
    return-void

    .line 692
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public static unhookLoadPackage(Lde/robv/android/xposed/callbacks/XC_LoadPackage;)V
    .registers 3
    .param p0, "callback"    # Lde/robv/android/xposed/callbacks/XC_LoadPackage;

    .prologue
    .line 675
    sget-object v1, Lde/robv/android/xposed/XposedBridge;->sLoadedPackageCallbacks:Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    monitor-enter v1

    .line 676
    :try_start_3
    sget-object v0, Lde/robv/android/xposed/XposedBridge;->sLoadedPackageCallbacks:Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    invoke-virtual {v0, p0}, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;->remove(Ljava/lang/Object;)Z

    .line 675
    monitor-exit v1

    .line 678
    return-void

    .line 675
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public static unhookMethod(Ljava/lang/reflect/Member;Lde/robv/android/xposed/XC_MethodHook;)V
    .registers 5
    .param p0, "hookMethod"    # Ljava/lang/reflect/Member;
    .param p1, "callback"    # Lde/robv/android/xposed/XC_MethodHook;

    .prologue
    .line 552
    sget-object v2, Lde/robv/android/xposed/XposedBridge;->sHookedMethodCallbacks:Ljava/util/Map;

    monitor-enter v2

    .line 553
    :try_start_3
    sget-object v1, Lde/robv/android/xposed/XposedBridge;->sHookedMethodCallbacks:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    .line 554
    .local v0, "callbacks":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/XC_MethodHook;>;"
    if-nez v0, :cond_f

    .line 555
    monitor-exit v2

    .line 558
    :goto_e
    return-void

    .line 552
    :cond_f
    monitor-exit v2
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_14

    .line 557
    invoke-virtual {v0, p1}, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;->remove(Ljava/lang/Object;)Z

    goto :goto_e

    .line 552
    .end local v0    # "callbacks":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/XC_MethodHook;>;"
    :catchall_14
    move-exception v1

    :try_start_15
    monitor-exit v2
    :try_end_16
    .catchall {:try_start_15 .. :try_end_16} :catchall_14

    throw v1
.end method
