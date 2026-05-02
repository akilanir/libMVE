.class public Landroid/content/res/XResources;
.super Landroid/content/res/MiuiResources;
.source "XResources.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/content/res/XResources$DimensionReplacement;,
        Landroid/content/res/XResources$DrawableLoader;,
        Landroid/content/res/XResources$ResourceNames;,
        Landroid/content/res/XResources$XMLInstanceDetails;,
        Landroid/content/res/XResources$XTypedArray;
    }
.end annotation


# static fields
.field private static final EXTRA_XML_INSTANCE_DETAILS:Ljava/lang/String; = "xmlInstanceDetails"

.field private static final sColorStateListCache:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Landroid/content/res/ColorStateList;",
            ">;"
        }
    .end annotation
.end field

.field private static final sIncludedLayouts:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/util/LinkedList",
            "<",
            "Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;",
            ">;>;"
        }
    .end annotation
.end field

.field private static sLatestResKey:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static final sLayoutCallbacks:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet",
            "<",
            "Lde/robv/android/xposed/callbacks/XC_LayoutInflated;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private static final sReplacements:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final sReplacementsCacheMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "[B>;"
        }
    .end annotation
.end field

.field private static final sResDirLastModified:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private static final sResDirPackageNames:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final sResourceNames:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/content/res/XResources$ResourceNames;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final sSystemReplacementsCache:[B

.field private static final sXmlInstanceDetails:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Landroid/content/res/XmlResourceParser;",
            "Landroid/content/res/XResources$XMLInstanceDetails;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mIsObjectInited:Z

.field private mPackageName:Ljava/lang/String;

.field private mReplacementsCache:[B

.field private mResDir:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 39
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Landroid/content/res/XResources;->sReplacements:Landroid/util/SparseArray;

    .line 41
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 40
    sput-object v0, Landroid/content/res/XResources;->sResourceNames:Landroid/util/SparseArray;

    .line 43
    const/16 v0, 0x100

    new-array v0, v0, [B

    sput-object v0, Landroid/content/res/XResources;->sSystemReplacementsCache:[B

    .line 45
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Landroid/content/res/XResources;->sReplacementsCacheMap:Ljava/util/HashMap;

    .line 46
    new-instance v0, Landroid/util/SparseArray;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/util/SparseArray;-><init>(I)V

    sput-object v0, Landroid/content/res/XResources;->sColorStateListCache:Landroid/util/SparseArray;

    .line 49
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 48
    sput-object v0, Landroid/content/res/XResources;->sLayoutCallbacks:Landroid/util/SparseArray;

    .line 51
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 50
    sput-object v0, Landroid/content/res/XResources;->sXmlInstanceDetails:Ljava/util/WeakHashMap;

    .line 54
    new-instance v0, Landroid/content/res/XResources$1;

    invoke-direct {v0}, Landroid/content/res/XResources$1;-><init>()V

    sput-object v0, Landroid/content/res/XResources;->sIncludedLayouts:Ljava/lang/ThreadLocal;

    .line 61
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Landroid/content/res/XResources;->sResDirLastModified:Ljava/util/HashMap;

    .line 62
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Landroid/content/res/XResources;->sResDirPackageNames:Ljava/util/HashMap;

    .line 63
    const/4 v0, 0x0

    sput-object v0, Landroid/content/res/XResources;->sLatestResKey:Ljava/lang/ThreadLocal;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 71
    invoke-direct {p0, v0, v0, v0}, Landroid/content/res/MiuiResources;-><init>(Landroid/content/res/AssetManager;Landroid/util/DisplayMetrics;Landroid/content/res/Configuration;)V

    .line 72
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method static synthetic access$0(Landroid/content/res/XResources;I)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 366
    invoke-direct {p0, p1}, Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1()Landroid/util/SparseArray;
    .registers 1

    .prologue
    .line 46
    sget-object v0, Landroid/content/res/XResources;->sColorStateListCache:Landroid/util/SparseArray;

    return-object v0
.end method

.method static synthetic access$2()Ljava/util/WeakHashMap;
    .registers 1

    .prologue
    .line 50
    sget-object v0, Landroid/content/res/XResources;->sXmlInstanceDetails:Ljava/util/WeakHashMap;

    return-object v0
.end method

.method static synthetic access$3()Ljava/lang/ThreadLocal;
    .registers 1

    .prologue
    .line 54
    sget-object v0, Landroid/content/res/XResources;->sIncludedLayouts:Ljava/lang/ThreadLocal;

    return-object v0
.end method

.method public static getFakeResId(Landroid/content/res/Resources;I)I
    .registers 3
    .param p0, "res"    # Landroid/content/res/Resources;
    .param p1, "id"    # I

    .prologue
    .line 815
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/content/res/XResources;->getFakeResId(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static getFakeResId(Ljava/lang/String;)I
    .registers 4
    .param p0, "resName"    # Ljava/lang/String;

    .prologue
    .line 811
    const/high16 v0, 0x7e000000

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const v2, 0xffffff

    and-int/2addr v1, v2

    or-int/2addr v0, v1

    return v0
.end method

.method private static getPackageName(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "resDir"    # Ljava/lang/String;

    .prologue
    .line 140
    if-nez p0, :cond_5

    .line 141
    const-string v0, "android"

    .line 156
    :cond_4
    :goto_4
    return-object v0

    .line 144
    :cond_5
    sget-object v3, Landroid/content/res/XResources;->sResDirPackageNames:Ljava/util/HashMap;

    monitor-enter v3

    .line 145
    :try_start_8
    sget-object v2, Landroid/content/res/XResources;->sResDirPackageNames:Ljava/util/HashMap;

    invoke-virtual {v2, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 144
    .local v0, "packageName":Ljava/lang/String;
    monitor-exit v3
    :try_end_11
    .catchall {:try_start_8 .. :try_end_11} :catchall_3e

    .line 148
    if-nez v0, :cond_4

    .line 151
    const/4 v2, 0x0

    invoke-static {p0, v2}, Landroid/content/pm/PackageParser;->parsePackageLite(Ljava/lang/String;I)Landroid/content/pm/PackageParser$PackageLite;

    move-result-object v1

    .line 152
    .local v1, "pkgInfo":Landroid/content/pm/PackageParser$PackageLite;
    if-eqz v1, :cond_41

    iget-object v2, v1, Landroid/content/pm/PackageParser$PackageLite;->packageName:Ljava/lang/String;

    if-eqz v2, :cond_41

    .line 153
    const-string v2, "Xposed"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Package name for "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " had to be retrieved via parser"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    iget-object v0, v1, Landroid/content/pm/PackageParser$PackageLite;->packageName:Ljava/lang/String;

    .line 155
    invoke-static {v0, p0}, Landroid/content/res/XResources;->setPackageNameForResDir(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 144
    .end local v0    # "packageName":Ljava/lang/String;
    .end local v1    # "pkgInfo":Landroid/content/pm/PackageParser$PackageLite;
    :catchall_3e
    move-exception v2

    :try_start_3f
    monitor-exit v3
    :try_end_40
    .catchall {:try_start_3f .. :try_end_40} :catchall_3e

    throw v2

    .line 159
    .restart local v0    # "packageName":Ljava/lang/String;
    .restart local v1    # "pkgInfo":Landroid/content/pm/PackageParser$PackageLite;
    :cond_41
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Could not determine package name for "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static getPackageNameDuringConstruction()Ljava/lang/String;
    .registers 4

    .prologue
    .line 171
    sget-object v2, Landroid/content/res/XResources;->sLatestResKey:Ljava/lang/ThreadLocal;

    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    .line 172
    .local v0, "key":Ljava/lang/Object;
    if-nez v0, :cond_10

    .line 173
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "This method can only be called during getTopLevelResources()"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 175
    :cond_10
    const-string v2, "mResDir"

    invoke-static {v0, v2}, Lde/robv/android/xposed/XposedHelpers;->getObjectField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 176
    .local v1, "resDir":Ljava/lang/String;
    invoke-static {v1}, Landroid/content/res/XResources;->getPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private getReplacement(I)Ljava/lang/Object;
    .registers 8
    .param p1, "id"    # I

    .prologue
    const/high16 v4, 0x70000

    const/4 v5, 0x1

    const/4 v2, 0x0

    .line 367
    if-gtz p1, :cond_7

    .line 393
    :cond_6
    :goto_6
    return-object v2

    .line 371
    :cond_7
    const/high16 v3, 0x7f000000

    if-ge p1, v3, :cond_40

    .line 372
    and-int v3, p1, v4

    shr-int/lit8 v3, v3, 0xb

    and-int/lit16 v4, p1, 0xf8

    shr-int/lit8 v4, v4, 0x3

    or-int v0, v3, v4

    .line 373
    .local v0, "cacheKey":I
    sget-object v3, Landroid/content/res/XResources;->sSystemReplacementsCache:[B

    aget-byte v3, v3, v0

    and-int/lit8 v4, p1, 0x7

    shl-int v4, v5, v4

    and-int/2addr v3, v4

    if-eqz v3, :cond_6

    .line 382
    .end local v0    # "cacheKey":I
    :cond_20
    sget-object v4, Landroid/content/res/XResources;->sReplacements:Landroid/util/SparseArray;

    monitor-enter v4

    .line 383
    :try_start_23
    sget-object v3, Landroid/content/res/XResources;->sReplacements:Landroid/util/SparseArray;

    invoke-virtual {v3, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 382
    .local v1, "inner":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    monitor-exit v4
    :try_end_2c
    .catchall {:try_start_23 .. :try_end_2c} :catchall_5a

    .line 386
    if-eqz v1, :cond_6

    .line 389
    monitor-enter v1

    .line 390
    :try_start_2f
    iget-object v3, p0, Landroid/content/res/XResources;->mResDir:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 391
    .local v2, "result":Ljava/lang/Object;
    if-nez v2, :cond_3b

    iget-object v3, p0, Landroid/content/res/XResources;->mResDir:Ljava/lang/String;

    if-nez v3, :cond_5d

    .line 392
    :cond_3b
    monitor-exit v1

    goto :goto_6

    .line 389
    .end local v2    # "result":Ljava/lang/Object;
    :catchall_3d
    move-exception v3

    monitor-exit v1
    :try_end_3f
    .catchall {:try_start_2f .. :try_end_3f} :catchall_3d

    throw v3

    .line 375
    .end local v1    # "inner":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_40
    iget-object v3, p0, Landroid/content/res/XResources;->mResDir:Ljava/lang/String;

    if-eqz v3, :cond_20

    .line 376
    and-int v3, p1, v4

    shr-int/lit8 v3, v3, 0xc

    and-int/lit8 v4, p1, 0x78

    shr-int/lit8 v4, v4, 0x3

    or-int v0, v3, v4

    .line 377
    .restart local v0    # "cacheKey":I
    iget-object v3, p0, Landroid/content/res/XResources;->mReplacementsCache:[B

    aget-byte v3, v3, v0

    and-int/lit8 v4, p1, 0x7

    shl-int v4, v5, v4

    and-int/2addr v3, v4

    if-nez v3, :cond_20

    goto :goto_6

    .line 382
    .end local v0    # "cacheKey":I
    :catchall_5a
    move-exception v3

    :try_start_5b
    monitor-exit v4
    :try_end_5c
    .catchall {:try_start_5b .. :try_end_5c} :catchall_5a

    throw v3

    .line 393
    .restart local v1    # "inner":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v2    # "result":Ljava/lang/Object;
    :cond_5d
    const/4 v3, 0x0

    :try_start_5e
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "result":Ljava/lang/Object;
    monitor-exit v1
    :try_end_63
    .catchall {:try_start_5e .. :try_end_63} :catchall_3d

    goto :goto_6
.end method

.method private getResourceNames(I)Landroid/content/res/XResources$ResourceNames;
    .registers 8
    .param p1, "id"    # I

    .prologue
    .line 259
    new-instance v0, Landroid/content/res/XResources$ResourceNames;

    .line 261
    invoke-virtual {p0, p1}, Landroid/content/res/XResources;->getResourcePackageName(I)Ljava/lang/String;

    move-result-object v2

    .line 262
    invoke-virtual {p0, p1}, Landroid/content/res/XResources;->getResourceTypeName(I)Ljava/lang/String;

    move-result-object v3

    .line 263
    invoke-virtual {p0, p1}, Landroid/content/res/XResources;->getResourceEntryName(I)Ljava/lang/String;

    move-result-object v4

    .line 259
    const/4 v5, 0x0

    move v1, p1

    invoke-direct/range {v0 .. v5}, Landroid/content/res/XResources$ResourceNames;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/res/XResources$ResourceNames;)V

    return-object v0
.end method

.method private static getSystemResourceNames(I)Landroid/content/res/XResources$ResourceNames;
    .registers 8
    .param p0, "id"    # I

    .prologue
    .line 267
    invoke-static {}, Landroid/content/res/XResources;->getSystem()Landroid/content/res/Resources;

    move-result-object v6

    .line 268
    .local v6, "sysRes":Landroid/content/res/Resources;
    new-instance v0, Landroid/content/res/XResources$ResourceNames;

    .line 270
    invoke-virtual {v6, p0}, Landroid/content/res/Resources;->getResourcePackageName(I)Ljava/lang/String;

    move-result-object v2

    .line 271
    invoke-virtual {v6, p0}, Landroid/content/res/Resources;->getResourceTypeName(I)Ljava/lang/String;

    move-result-object v3

    .line 272
    invoke-virtual {v6, p0}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    move-result-object v4

    .line 268
    const/4 v5, 0x0

    move v1, p0

    invoke-direct/range {v0 .. v5}, Landroid/content/res/XResources$ResourceNames;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/res/XResources$ResourceNames;)V

    return-object v0
.end method

.method private static hookLayoutInternal(Ljava/lang/String;ILandroid/content/res/XResources$ResourceNames;Lde/robv/android/xposed/callbacks/XC_LayoutInflated;)Lde/robv/android/xposed/callbacks/XC_LayoutInflated$Unhook;
    .registers 8
    .param p0, "resDir"    # Ljava/lang/String;
    .param p1, "id"    # I
    .param p2, "resNames"    # Landroid/content/res/XResources$ResourceNames;
    .param p3, "callback"    # Lde/robv/android/xposed/callbacks/XC_LayoutInflated;

    .prologue
    .line 1206
    if-nez p1, :cond_a

    .line 1207
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "id 0 is not an allowed resource identifier"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1210
    :cond_a
    sget-object v3, Landroid/content/res/XResources;->sLayoutCallbacks:Landroid/util/SparseArray;

    monitor-enter v3

    .line 1211
    :try_start_d
    sget-object v2, Landroid/content/res/XResources;->sLayoutCallbacks:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 1212
    .local v1, "inner":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/callbacks/XC_LayoutInflated;>;>;"
    if-nez v1, :cond_21

    .line 1213
    new-instance v1, Ljava/util/HashMap;

    .end local v1    # "inner":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/callbacks/XC_LayoutInflated;>;>;"
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 1214
    .restart local v1    # "inner":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/callbacks/XC_LayoutInflated;>;>;"
    sget-object v2, Landroid/content/res/XResources;->sLayoutCallbacks:Landroid/util/SparseArray;

    invoke-virtual {v2, p1, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 1210
    :cond_21
    monitor-exit v3
    :try_end_22
    .catchall {:try_start_d .. :try_end_22} :catchall_43

    .line 1219
    monitor-enter v1

    .line 1220
    :try_start_23
    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    .line 1221
    .local v0, "callbacks":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/callbacks/XC_LayoutInflated;>;"
    if-nez v0, :cond_33

    .line 1222
    new-instance v0, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    .end local v0    # "callbacks":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/callbacks/XC_LayoutInflated;>;"
    invoke-direct {v0}, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;-><init>()V

    .line 1223
    .restart local v0    # "callbacks":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/callbacks/XC_LayoutInflated;>;"
    invoke-virtual {v1, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1219
    :cond_33
    monitor-exit v1
    :try_end_34
    .catchall {:try_start_23 .. :try_end_34} :catchall_46

    .line 1227
    invoke-virtual {v0, p3}, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;->add(Ljava/lang/Object;)Z

    .line 1229
    invoke-static {p0, p2}, Landroid/content/res/XResources;->putResourceNames(Ljava/lang/String;Landroid/content/res/XResources$ResourceNames;)V

    .line 1231
    new-instance v2, Lde/robv/android/xposed/callbacks/XC_LayoutInflated$Unhook;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v2, p3, p0, p1}, Lde/robv/android/xposed/callbacks/XC_LayoutInflated$Unhook;-><init>(Lde/robv/android/xposed/callbacks/XC_LayoutInflated;Ljava/lang/String;I)V

    return-object v2

    .line 1210
    .end local v0    # "callbacks":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/callbacks/XC_LayoutInflated;>;"
    .end local v1    # "inner":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/callbacks/XC_LayoutInflated;>;>;"
    :catchall_43
    move-exception v2

    :try_start_44
    monitor-exit v3
    :try_end_45
    .catchall {:try_start_44 .. :try_end_45} :catchall_43

    throw v2

    .line 1219
    .restart local v1    # "inner":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/callbacks/XC_LayoutInflated;>;>;"
    :catchall_46
    move-exception v2

    :try_start_47
    monitor-exit v1
    :try_end_48
    .catchall {:try_start_47 .. :try_end_48} :catchall_46

    throw v2
.end method

.method public static hookSystemWideLayout(ILde/robv/android/xposed/callbacks/XC_LayoutInflated;)Lde/robv/android/xposed/callbacks/XC_LayoutInflated$Unhook;
    .registers 4
    .param p0, "id"    # I
    .param p1, "callback"    # Lde/robv/android/xposed/callbacks/XC_LayoutInflated;

    .prologue
    .line 1184
    const/high16 v0, 0x7f000000

    if-lt p0, v0, :cond_c

    .line 1185
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "ids >= 0x7f000000 are app specific and cannot be set for the framework"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1186
    :cond_c
    const/4 v0, 0x0

    invoke-static {p0}, Landroid/content/res/XResources;->getSystemResourceNames(I)Landroid/content/res/XResources$ResourceNames;

    move-result-object v1

    invoke-static {v0, p0, v1, p1}, Landroid/content/res/XResources;->hookLayoutInternal(Ljava/lang/String;ILandroid/content/res/XResources$ResourceNames;Lde/robv/android/xposed/callbacks/XC_LayoutInflated;)Lde/robv/android/xposed/callbacks/XC_LayoutInflated$Unhook;

    move-result-object v0

    return-object v0
.end method

.method public static hookSystemWideLayout(Ljava/lang/String;Lde/robv/android/xposed/callbacks/XC_LayoutInflated;)Lde/robv/android/xposed/callbacks/XC_LayoutInflated$Unhook;
    .registers 5
    .param p0, "fullName"    # Ljava/lang/String;
    .param p1, "callback"    # Lde/robv/android/xposed/callbacks/XC_LayoutInflated;

    .prologue
    const/4 v2, 0x0

    .line 1191
    invoke-static {}, Landroid/content/res/XResources;->getSystem()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p0, v2, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 1192
    .local v0, "id":I
    if-nez v0, :cond_11

    .line 1193
    new-instance v1, Landroid/content/res/Resources$NotFoundException;

    invoke-direct {v1, p0}, Landroid/content/res/Resources$NotFoundException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1194
    :cond_11
    invoke-static {v0, p1}, Landroid/content/res/XResources;->hookSystemWideLayout(ILde/robv/android/xposed/callbacks/XC_LayoutInflated;)Lde/robv/android/xposed/callbacks/XC_LayoutInflated$Unhook;

    move-result-object v1

    return-object v1
.end method

.method public static hookSystemWideLayout(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lde/robv/android/xposed/callbacks/XC_LayoutInflated;)Lde/robv/android/xposed/callbacks/XC_LayoutInflated$Unhook;
    .registers 8
    .param p0, "pkg"    # Ljava/lang/String;
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "callback"    # Lde/robv/android/xposed/callbacks/XC_LayoutInflated;

    .prologue
    .line 1199
    invoke-static {}, Landroid/content/res/XResources;->getSystem()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p2, p1, p0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 1200
    .local v0, "id":I
    if-nez v0, :cond_31

    .line 1201
    new-instance v1, Landroid/content/res/Resources$NotFoundException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/content/res/Resources$NotFoundException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1202
    :cond_31
    invoke-static {v0, p3}, Landroid/content/res/XResources;->hookSystemWideLayout(ILde/robv/android/xposed/callbacks/XC_LayoutInflated;)Lde/robv/android/xposed/callbacks/XC_LayoutInflated$Unhook;

    move-result-object v1

    return-object v1
.end method

.method public static init(Ljava/lang/ThreadLocal;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .local p0, "latestResKey":Ljava/lang/ThreadLocal;, "Ljava/lang/ThreadLocal<Ljava/lang/Object;>;"
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 181
    sput-object p0, Landroid/content/res/XResources;->sLatestResKey:Ljava/lang/ThreadLocal;

    .line 183
    const-class v0, Landroid/view/LayoutInflater;

    const-string v1, "inflate"

    new-array v2, v8, [Ljava/lang/Object;

    const-class v3, Lorg/xmlpull/v1/XmlPullParser;

    aput-object v3, v2, v4

    const-class v3, Landroid/view/ViewGroup;

    aput-object v3, v2, v5

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v3, v2, v6

    new-instance v3, Landroid/content/res/XResources$2;

    invoke-direct {v3}, Landroid/content/res/XResources$2;-><init>()V

    aput-object v3, v2, v7

    invoke-static {v0, v1, v2}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    .line 204
    const-class v0, Landroid/view/LayoutInflater;

    const-string v1, "parseInclude"

    new-array v2, v8, [Ljava/lang/Object;

    const-class v3, Lorg/xmlpull/v1/XmlPullParser;

    aput-object v3, v2, v4

    const-class v3, Landroid/view/View;

    aput-object v3, v2, v5

    const-class v3, Landroid/util/AttributeSet;

    aput-object v3, v2, v6

    new-instance v3, Landroid/content/res/XResources$3;

    invoke-direct {v3}, Landroid/content/res/XResources$3;-><init>()V

    aput-object v3, v2, v7

    invoke-static {v0, v1, v2}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    .line 230
    return-void
.end method

.method private static isXmlCached(Landroid/content/res/Resources;I)Z
    .registers 6
    .param p0, "res"    # Landroid/content/res/Resources;
    .param p1, "id"    # I

    .prologue
    .line 749
    const-string v3, "mCachedXmlBlockIds"

    invoke-static {p0, v3}, Lde/robv/android/xposed/XposedHelpers;->getObjectField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    .line 750
    .local v1, "mCachedXmlBlockIds":[I
    monitor-enter v1

    .line 751
    :try_start_9
    array-length v2, v1

    .line 752
    .local v2, "num":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_b
    if-lt v0, v2, :cond_10

    .line 750
    monitor-exit v1

    .line 757
    const/4 v3, 0x0

    :goto_f
    return v3

    .line 753
    :cond_10
    aget v3, v1, v0

    if-ne v3, p1, :cond_17

    .line 754
    monitor-exit v1

    const/4 v3, 0x1

    goto :goto_f

    .line 752
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 750
    .end local v0    # "i":I
    .end local v2    # "num":I
    :catchall_1a
    move-exception v3

    monitor-exit v1
    :try_end_1c
    .catchall {:try_start_9 .. :try_end_1c} :catchall_1a

    throw v3
.end method

.method private static putResourceNames(Ljava/lang/String;Landroid/content/res/XResources$ResourceNames;)V
    .registers 6
    .param p0, "resDir"    # Ljava/lang/String;
    .param p1, "resNames"    # Landroid/content/res/XResources$ResourceNames;

    .prologue
    .line 276
    iget v0, p1, Landroid/content/res/XResources$ResourceNames;->id:I

    .line 277
    .local v0, "id":I
    sget-object v3, Landroid/content/res/XResources;->sResourceNames:Landroid/util/SparseArray;

    monitor-enter v3

    .line 278
    :try_start_5
    sget-object v2, Landroid/content/res/XResources;->sResourceNames:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 279
    .local v1, "inner":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Landroid/content/res/XResources$ResourceNames;>;"
    if-nez v1, :cond_19

    .line 280
    new-instance v1, Ljava/util/HashMap;

    .end local v1    # "inner":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Landroid/content/res/XResources$ResourceNames;>;"
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 281
    .restart local v1    # "inner":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Landroid/content/res/XResources$ResourceNames;>;"
    sget-object v2, Landroid/content/res/XResources;->sResourceNames:Landroid/util/SparseArray;

    invoke-virtual {v2, v0, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 283
    :cond_19
    monitor-enter v1
    :try_end_1a
    .catchall {:try_start_5 .. :try_end_1a} :catchall_23

    .line 284
    :try_start_1a
    invoke-virtual {v1, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    monitor-exit v1
    :try_end_1e
    .catchall {:try_start_1a .. :try_end_1e} :catchall_20

    .line 277
    :try_start_1e
    monitor-exit v3
    :try_end_1f
    .catchall {:try_start_1e .. :try_end_1f} :catchall_23

    .line 287
    return-void

    .line 283
    :catchall_20
    move-exception v2

    :try_start_21
    monitor-exit v1
    :try_end_22
    .catchall {:try_start_21 .. :try_end_22} :catchall_20

    :try_start_22
    throw v2

    .line 277
    .end local v1    # "inner":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Landroid/content/res/XResources$ResourceNames;>;"
    :catchall_23
    move-exception v2

    monitor-exit v3
    :try_end_25
    .catchall {:try_start_22 .. :try_end_25} :catchall_23

    throw v2
.end method

.method private static native rewriteXmlReferencesNative(ILandroid/content/res/XResources;Landroid/content/res/Resources;)V
.end method

.method public static setPackageNameForResDir(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p0, "packageName"    # Ljava/lang/String;
    .param p1, "resDir"    # Ljava/lang/String;

    .prologue
    .line 127
    sget-object v1, Landroid/content/res/XResources;->sResDirPackageNames:Ljava/util/HashMap;

    monitor-enter v1

    .line 128
    :try_start_3
    sget-object v0, Landroid/content/res/XResources;->sResDirPackageNames:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    monitor-exit v1

    .line 130
    return-void

    .line 127
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method private static setReplacement(ILjava/lang/Object;Landroid/content/res/XResources;)V
    .registers 11
    .param p0, "id"    # I
    .param p1, "replacement"    # Ljava/lang/Object;
    .param p2, "res"    # Landroid/content/res/XResources;

    .prologue
    const/high16 v5, 0x7f000000

    const/high16 v4, 0x70000

    const/4 v7, 0x1

    .line 330
    if-eqz p2, :cond_13

    iget-object v2, p2, Landroid/content/res/XResources;->mResDir:Ljava/lang/String;

    .line 331
    .local v2, "resDir":Ljava/lang/String;
    :goto_9
    if-nez p0, :cond_15

    .line 332
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "id 0 is not an allowed resource identifier"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 330
    .end local v2    # "resDir":Ljava/lang/String;
    :cond_13
    const/4 v2, 0x0

    goto :goto_9

    .line 333
    .restart local v2    # "resDir":Ljava/lang/String;
    :cond_15
    if-nez v2, :cond_21

    if-lt p0, v5, :cond_21

    .line 334
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "ids >= 0x7f000000 are app specific and cannot be set for the framework"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 336
    :cond_21
    instance-of v3, p1, Landroid/graphics/drawable/Drawable;

    if-eqz v3, :cond_2d

    .line 337
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Drawable replacements are deprecated since Xposed 2.1. Use DrawableLoader instead."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 340
    :cond_2d
    if-ge p0, v5, :cond_68

    .line 341
    and-int v3, p0, v4

    shr-int/lit8 v3, v3, 0xb

    and-int/lit16 v4, p0, 0xf8

    shr-int/lit8 v4, v4, 0x3

    or-int v0, v3, v4

    .line 342
    .local v0, "cacheKey":I
    sget-object v4, Landroid/content/res/XResources;->sSystemReplacementsCache:[B

    monitor-enter v4

    .line 343
    :try_start_3c
    sget-object v3, Landroid/content/res/XResources;->sSystemReplacementsCache:[B

    aget-byte v5, v3, v0

    and-int/lit8 v6, p0, 0x7

    shl-int v6, v7, v6

    or-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, v3, v0

    .line 342
    monitor-exit v4
    :try_end_49
    .catchall {:try_start_3c .. :try_end_49} :catchall_65

    .line 352
    :goto_49
    sget-object v4, Landroid/content/res/XResources;->sReplacements:Landroid/util/SparseArray;

    monitor-enter v4

    .line 353
    :try_start_4c
    sget-object v3, Landroid/content/res/XResources;->sReplacements:Landroid/util/SparseArray;

    invoke-virtual {v3, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 354
    .local v1, "inner":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-nez v1, :cond_60

    .line 355
    new-instance v1, Ljava/util/HashMap;

    .end local v1    # "inner":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 356
    .restart local v1    # "inner":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    sget-object v3, Landroid/content/res/XResources;->sReplacements:Landroid/util/SparseArray;

    invoke-virtual {v3, p0, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 358
    :cond_60
    invoke-virtual {v1, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 352
    monitor-exit v4
    :try_end_64
    .catchall {:try_start_4c .. :try_end_64} :catchall_86

    .line 360
    return-void

    .line 342
    .end local v1    # "inner":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :catchall_65
    move-exception v3

    :try_start_66
    monitor-exit v4
    :try_end_67
    .catchall {:try_start_66 .. :try_end_67} :catchall_65

    throw v3

    .line 346
    .end local v0    # "cacheKey":I
    :cond_68
    and-int v3, p0, v4

    shr-int/lit8 v3, v3, 0xc

    and-int/lit8 v4, p0, 0x78

    shr-int/lit8 v4, v4, 0x3

    or-int v0, v3, v4

    .line 347
    .restart local v0    # "cacheKey":I
    iget-object v4, p2, Landroid/content/res/XResources;->mReplacementsCache:[B

    monitor-enter v4

    .line 348
    :try_start_75
    iget-object v3, p2, Landroid/content/res/XResources;->mReplacementsCache:[B

    aget-byte v5, v3, v0

    and-int/lit8 v6, p0, 0x7

    shl-int v6, v7, v6

    or-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, v3, v0

    .line 347
    monitor-exit v4

    goto :goto_49

    :catchall_83
    move-exception v3

    monitor-exit v4
    :try_end_85
    .catchall {:try_start_75 .. :try_end_85} :catchall_83

    throw v3

    .line 352
    :catchall_86
    move-exception v3

    :try_start_87
    monitor-exit v4
    :try_end_88
    .catchall {:try_start_87 .. :try_end_88} :catchall_86

    throw v3
.end method

.method public static setSystemWideReplacement(ILjava/lang/Object;)V
    .registers 3
    .param p0, "id"    # I
    .param p1, "replacement"    # Ljava/lang/Object;

    .prologue
    .line 312
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/content/res/XResources;->setReplacement(ILjava/lang/Object;Landroid/content/res/XResources;)V

    .line 313
    return-void
.end method

.method public static setSystemWideReplacement(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 5
    .param p0, "fullName"    # Ljava/lang/String;
    .param p1, "replacement"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x0

    .line 316
    invoke-static {}, Landroid/content/res/XResources;->getSystem()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p0, v2, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 317
    .local v0, "id":I
    if-nez v0, :cond_11

    .line 318
    new-instance v1, Landroid/content/res/Resources$NotFoundException;

    invoke-direct {v1, p0}, Landroid/content/res/Resources$NotFoundException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 319
    :cond_11
    invoke-static {v0, p1, v2}, Landroid/content/res/XResources;->setReplacement(ILjava/lang/Object;Landroid/content/res/XResources;)V

    .line 320
    return-void
.end method

.method public static setSystemWideReplacement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 8
    .param p0, "pkg"    # Ljava/lang/String;
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "replacement"    # Ljava/lang/Object;

    .prologue
    .line 323
    invoke-static {}, Landroid/content/res/XResources;->getSystem()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p2, p1, p0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 324
    .local v0, "id":I
    if-nez v0, :cond_31

    .line 325
    new-instance v1, Landroid/content/res/Resources$NotFoundException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/content/res/Resources$NotFoundException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 326
    :cond_31
    const/4 v1, 0x0

    invoke-static {v0, p3, v1}, Landroid/content/res/XResources;->setReplacement(ILjava/lang/Object;Landroid/content/res/XResources;)V

    .line 327
    return-void
.end method

.method private static translateAttrId(Ljava/lang/String;Landroid/content/res/XResources;)I
    .registers 7
    .param p0, "attrName"    # Ljava/lang/String;
    .param p1, "origRes"    # Landroid/content/res/XResources;

    .prologue
    .line 831
    iget-object v2, p1, Landroid/content/res/XResources;->mPackageName:Ljava/lang/String;

    .line 832
    .local v2, "origPackage":Ljava/lang/String;
    const/4 v1, 0x0

    .line 834
    .local v1, "origAttrId":I
    :try_start_3
    const-string v3, "attr"

    invoke-virtual {p1, p0, v3, v2}, Landroid/content/res/XResources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    :try_end_8
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_3 .. :try_end_8} :catch_a

    move-result v1

    .line 838
    :goto_9
    return v1

    .line 835
    :catch_a
    move-exception v0

    .line 836
    .local v0, "e":Landroid/content/res/Resources$NotFoundException;
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Attribute "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " not found in original resources"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    goto :goto_9
.end method

.method private static translateResId(ILandroid/content/res/XResources;Landroid/content/res/Resources;)I
    .registers 13
    .param p0, "id"    # I
    .param p1, "origRes"    # Landroid/content/res/XResources;
    .param p2, "repRes"    # Landroid/content/res/Resources;

    .prologue
    const/4 v7, 0x0

    .line 772
    :try_start_1
    invoke-virtual {p2, p0}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    move-result-object v1

    .line 773
    .local v1, "entryName":Ljava/lang/String;
    invoke-virtual {p2, p0}, Landroid/content/res/Resources;->getResourceTypeName(I)Ljava/lang/String;

    move-result-object v2

    .line 774
    .local v2, "entryType":Ljava/lang/String;
    iget-object v3, p1, Landroid/content/res/XResources;->mPackageName:Ljava/lang/String;
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_b} :catch_6e

    .line 775
    .local v3, "origPackage":Ljava/lang/String;
    const/4 v4, 0x0

    .line 778
    .local v4, "origResId":I
    :try_start_c
    invoke-virtual {p1, v1, v2, v3}, Landroid/content/res/XResources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    :try_end_f
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_c .. :try_end_f} :catch_74
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_f} :catch_6e

    move-result v4

    .line 781
    :goto_10
    const/4 v5, 0x0

    .line 783
    .local v5, "repResDefined":Z
    :try_start_11
    new-instance v6, Landroid/util/TypedValue;

    invoke-direct {v6}, Landroid/util/TypedValue;-><init>()V

    .line 784
    .local v6, "tmpValue":Landroid/util/TypedValue;
    const/4 v8, 0x0

    invoke-virtual {p2, p0, v6, v8}, Landroid/content/res/Resources;->getValue(ILandroid/util/TypedValue;Z)V

    .line 787
    iget v8, v6, Landroid/util/TypedValue;->type:I

    const/16 v9, 0x12

    if-ne v8, v9, :cond_52

    iget v8, v6, Landroid/util/TypedValue;->data:I
    :try_end_22
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_11 .. :try_end_22} :catch_76
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_22} :catch_6e

    if-nez v8, :cond_52

    move v5, v7

    .line 790
    .end local v6    # "tmpValue":Landroid/util/TypedValue;
    :goto_25
    if-nez v5, :cond_54

    if-nez v4, :cond_54

    :try_start_29
    const-string v8, "id"

    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_54

    .line 791
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " is neither defined in module nor in original resources"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    .line 806
    .end local v1    # "entryName":Ljava/lang/String;
    .end local v2    # "entryType":Ljava/lang/String;
    .end local v3    # "origPackage":Ljava/lang/String;
    .end local v4    # "origResId":I
    .end local v5    # "repResDefined":Z
    :goto_51
    return v7

    .line 787
    .restart local v1    # "entryName":Ljava/lang/String;
    .restart local v2    # "entryType":Ljava/lang/String;
    .restart local v3    # "origPackage":Ljava/lang/String;
    .restart local v4    # "origResId":I
    .restart local v5    # "repResDefined":Z
    .restart local v6    # "tmpValue":Landroid/util/TypedValue;
    :cond_52
    const/4 v5, 0x1

    goto :goto_25

    .line 796
    .end local v6    # "tmpValue":Landroid/util/TypedValue;
    :cond_54
    if-nez v4, :cond_5a

    .line 797
    invoke-static {p2, p0}, Landroid/content/res/XResources;->getFakeResId(Landroid/content/res/Resources;I)I

    move-result v4

    .line 800
    :cond_5a
    if-eqz v5, :cond_6c

    const-string v7, "id"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_6c

    .line 801
    new-instance v7, Landroid/content/res/XResForwarder;

    invoke-direct {v7, p2, p0}, Landroid/content/res/XResForwarder;-><init>(Landroid/content/res/Resources;I)V

    invoke-virtual {p1, v4, v7}, Landroid/content/res/XResources;->setReplacement(ILjava/lang/Object;)V
    :try_end_6c
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_6c} :catch_6e

    :cond_6c
    move v7, v4

    .line 803
    goto :goto_51

    .line 804
    .end local v1    # "entryName":Ljava/lang/String;
    .end local v2    # "entryType":Ljava/lang/String;
    .end local v3    # "origPackage":Ljava/lang/String;
    .end local v4    # "origResId":I
    .end local v5    # "repResDefined":Z
    :catch_6e
    move-exception v0

    .line 805
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    move v7, p0

    .line 806
    goto :goto_51

    .line 779
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "entryName":Ljava/lang/String;
    .restart local v2    # "entryType":Ljava/lang/String;
    .restart local v3    # "origPackage":Ljava/lang/String;
    .restart local v4    # "origResId":I
    :catch_74
    move-exception v8

    goto :goto_10

    .line 788
    .restart local v5    # "repResDefined":Z
    :catch_76
    move-exception v8

    goto :goto_25
.end method

.method public static unhookLayout(Ljava/lang/String;ILde/robv/android/xposed/callbacks/XC_LayoutInflated;)V
    .registers 7
    .param p0, "resDir"    # Ljava/lang/String;
    .param p1, "id"    # I
    .param p2, "callback"    # Lde/robv/android/xposed/callbacks/XC_LayoutInflated;

    .prologue
    .line 1236
    sget-object v3, Landroid/content/res/XResources;->sLayoutCallbacks:Landroid/util/SparseArray;

    monitor-enter v3

    .line 1237
    :try_start_3
    sget-object v2, Landroid/content/res/XResources;->sLayoutCallbacks:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 1238
    .local v1, "inner":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/callbacks/XC_LayoutInflated;>;>;"
    if-nez v1, :cond_f

    .line 1239
    monitor-exit v3

    .line 1250
    :goto_e
    return-void

    .line 1236
    :cond_f
    monitor-exit v3
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_1e

    .line 1243
    monitor-enter v1

    .line 1244
    :try_start_11
    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    .line 1245
    .local v0, "callbacks":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/callbacks/XC_LayoutInflated;>;"
    if-nez v0, :cond_21

    .line 1246
    monitor-exit v1

    goto :goto_e

    .line 1243
    .end local v0    # "callbacks":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/callbacks/XC_LayoutInflated;>;"
    :catchall_1b
    move-exception v2

    monitor-exit v1
    :try_end_1d
    .catchall {:try_start_11 .. :try_end_1d} :catchall_1b

    throw v2

    .line 1236
    .end local v1    # "inner":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/callbacks/XC_LayoutInflated;>;>;"
    :catchall_1e
    move-exception v2

    :try_start_1f
    monitor-exit v3
    :try_end_20
    .catchall {:try_start_1f .. :try_end_20} :catchall_1e

    throw v2

    .line 1243
    .restart local v0    # "callbacks":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/callbacks/XC_LayoutInflated;>;"
    .restart local v1    # "inner":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/callbacks/XC_LayoutInflated;>;>;"
    :cond_21
    :try_start_21
    monitor-exit v1
    :try_end_22
    .catchall {:try_start_21 .. :try_end_22} :catchall_1b

    .line 1249
    invoke-virtual {v0, p2}, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;->remove(Ljava/lang/Object;)Z

    goto :goto_e
.end method


# virtual methods
.method public addResource(Landroid/content/res/Resources;I)I
    .registers 6
    .param p1, "res"    # Landroid/content/res/Resources;
    .param p2, "id"    # I

    .prologue
    .line 819
    invoke-static {p1, p2}, Landroid/content/res/XResources;->getFakeResId(Landroid/content/res/Resources;I)I

    move-result v0

    .line 820
    .local v0, "fakeId":I
    sget-object v2, Landroid/content/res/XResources;->sReplacements:Landroid/util/SparseArray;

    monitor-enter v2

    .line 821
    :try_start_7
    sget-object v1, Landroid/content/res/XResources;->sReplacements:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->indexOfKey(I)I

    move-result v1

    if-gez v1, :cond_17

    .line 822
    new-instance v1, Landroid/content/res/XResForwarder;

    invoke-direct {v1, p1, p2}, Landroid/content/res/XResForwarder;-><init>(Landroid/content/res/Resources;I)V

    invoke-virtual {p0, v0, v1}, Landroid/content/res/XResources;->setReplacement(ILjava/lang/Object;)V

    .line 820
    :cond_17
    monitor-exit v2

    .line 824
    return v0

    .line 820
    :catchall_19
    move-exception v1

    monitor-exit v2
    :try_end_1b
    .catchall {:try_start_7 .. :try_end_1b} :catchall_19

    throw v1
.end method

.method public getAnimation(I)Landroid/content/res/XmlResourceParser;
    .registers 9
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 399
    invoke-direct {p0, p1}, Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;

    move-result-object v4

    .line 400
    .local v4, "replacement":Ljava/lang/Object;
    instance-of v6, v4, Landroid/content/res/XResForwarder;

    if-eqz v6, :cond_29

    move-object v6, v4

    .line 401
    check-cast v6, Landroid/content/res/XResForwarder;

    invoke-virtual {v6}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 402
    .local v3, "repRes":Landroid/content/res/Resources;
    check-cast v4, Landroid/content/res/XResForwarder;

    .end local v4    # "replacement":Ljava/lang/Object;
    invoke-virtual {v4}, Landroid/content/res/XResForwarder;->getId()I

    move-result v2

    .line 404
    .local v2, "repId":I
    invoke-static {v3, v2}, Landroid/content/res/XResources;->isXmlCached(Landroid/content/res/Resources;I)Z

    move-result v0

    .line 405
    .local v0, "loadedFromCache":Z
    invoke-virtual {v3, v2}, Landroid/content/res/Resources;->getAnimation(I)Landroid/content/res/XmlResourceParser;

    move-result-object v5

    .line 407
    .local v5, "result":Landroid/content/res/XmlResourceParser;
    if-nez v0, :cond_28

    .line 408
    const-string v6, "mParseState"

    invoke-static {v5, v6}, Lde/robv/android/xposed/XposedHelpers;->getIntField(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v1

    .line 409
    .local v1, "parseState":I
    invoke-static {v1, p0, v3}, Landroid/content/res/XResources;->rewriteXmlReferencesNative(ILandroid/content/res/XResources;Landroid/content/res/Resources;)V

    .line 414
    .end local v0    # "loadedFromCache":Z
    .end local v1    # "parseState":I
    .end local v2    # "repId":I
    .end local v3    # "repRes":Landroid/content/res/Resources;
    .end local v5    # "result":Landroid/content/res/XmlResourceParser;
    :cond_28
    :goto_28
    return-object v5

    .restart local v4    # "replacement":Ljava/lang/Object;
    :cond_29
    invoke-super {p0, p1}, Landroid/content/res/MiuiResources;->getAnimation(I)Landroid/content/res/XmlResourceParser;

    move-result-object v5

    goto :goto_28
.end method

.method public getBoolean(I)Z
    .registers 6
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 419
    invoke-direct {p0, p1}, Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;

    move-result-object v2

    .line 420
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v3, v2, Ljava/lang/Boolean;

    if-eqz v3, :cond_f

    .line 421
    check-cast v2, Ljava/lang/Boolean;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    .line 427
    :goto_e
    return v3

    .line 422
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_f
    instance-of v3, v2, Landroid/content/res/XResForwarder;

    if-eqz v3, :cond_25

    move-object v3, v2

    .line 423
    check-cast v3, Landroid/content/res/XResForwarder;

    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 424
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 425
    .local v0, "repId":I
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    goto :goto_e

    .line 427
    .end local v0    # "repId":I
    .end local v1    # "repRes":Landroid/content/res/Resources;
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_25
    invoke-super {p0, p1}, Landroid/content/res/MiuiResources;->getBoolean(I)Z

    move-result v3

    goto :goto_e
.end method

.method public getColor(I)I
    .registers 6
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 432
    invoke-direct {p0, p1}, Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;

    move-result-object v2

    .line 433
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v3, v2, Ljava/lang/Integer;

    if-eqz v3, :cond_f

    .line 434
    check-cast v2, Ljava/lang/Integer;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 440
    :goto_e
    return v3

    .line 435
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_f
    instance-of v3, v2, Landroid/content/res/XResForwarder;

    if-eqz v3, :cond_25

    move-object v3, v2

    .line 436
    check-cast v3, Landroid/content/res/XResForwarder;

    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 437
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 438
    .local v0, "repId":I
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    goto :goto_e

    .line 440
    .end local v0    # "repId":I
    .end local v1    # "repRes":Landroid/content/res/Resources;
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_25
    invoke-super {p0, p1}, Landroid/content/res/MiuiResources;->getColor(I)I

    move-result v3

    goto :goto_e
.end method

.method public getColorStateList(I)Landroid/content/res/ColorStateList;
    .registers 9
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 445
    invoke-direct {p0, p1}, Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;

    move-result-object v3

    .line 446
    .local v3, "replacement":Ljava/lang/Object;
    instance-of v5, v3, Landroid/content/res/ColorStateList;

    if-eqz v5, :cond_b

    .line 447
    check-cast v3, Landroid/content/res/ColorStateList;

    .line 463
    .end local v3    # "replacement":Ljava/lang/Object;
    :goto_a
    return-object v3

    .line 448
    .restart local v3    # "replacement":Ljava/lang/Object;
    :cond_b
    instance-of v5, v3, Ljava/lang/Integer;

    if-eqz v5, :cond_31

    .line 449
    check-cast v3, Ljava/lang/Integer;

    .end local v3    # "replacement":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 450
    .local v0, "color":I
    sget-object v6, Landroid/content/res/XResources;->sColorStateListCache:Landroid/util/SparseArray;

    monitor-enter v6

    .line 451
    :try_start_18
    sget-object v5, Landroid/content/res/XResources;->sColorStateListCache:Landroid/util/SparseArray;

    invoke-virtual {v5, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/res/ColorStateList;

    .line 452
    .local v4, "result":Landroid/content/res/ColorStateList;
    if-nez v4, :cond_2b

    .line 453
    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v4

    .line 454
    sget-object v5, Landroid/content/res/XResources;->sColorStateListCache:Landroid/util/SparseArray;

    invoke-virtual {v5, v0, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 456
    :cond_2b
    monitor-exit v6

    move-object v3, v4

    goto :goto_a

    .line 450
    .end local v4    # "result":Landroid/content/res/ColorStateList;
    :catchall_2e
    move-exception v5

    monitor-exit v6
    :try_end_30
    .catchall {:try_start_18 .. :try_end_30} :catchall_2e

    throw v5

    .line 458
    .end local v0    # "color":I
    .restart local v3    # "replacement":Ljava/lang/Object;
    :cond_31
    instance-of v5, v3, Landroid/content/res/XResForwarder;

    if-eqz v5, :cond_47

    move-object v5, v3

    .line 459
    check-cast v5, Landroid/content/res/XResForwarder;

    invoke-virtual {v5}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 460
    .local v2, "repRes":Landroid/content/res/Resources;
    check-cast v3, Landroid/content/res/XResForwarder;

    .end local v3    # "replacement":Ljava/lang/Object;
    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getId()I

    move-result v1

    .line 461
    .local v1, "repId":I
    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    goto :goto_a

    .line 463
    .end local v1    # "repId":I
    .end local v2    # "repRes":Landroid/content/res/Resources;
    .restart local v3    # "replacement":Ljava/lang/Object;
    :cond_47
    invoke-super {p0, p1}, Landroid/content/res/MiuiResources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    goto :goto_a
.end method

.method public getDimension(I)F
    .registers 6
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 468
    invoke-direct {p0, p1}, Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;

    move-result-object v2

    .line 469
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v3, v2, Landroid/content/res/XResources$DimensionReplacement;

    if-eqz v3, :cond_13

    .line 470
    check-cast v2, Landroid/content/res/XResources$DimensionReplacement;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/content/res/XResources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/res/XResources$DimensionReplacement;->getDimension(Landroid/util/DisplayMetrics;)F

    move-result v3

    .line 476
    :goto_12
    return v3

    .line 471
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_13
    instance-of v3, v2, Landroid/content/res/XResForwarder;

    if-eqz v3, :cond_29

    move-object v3, v2

    .line 472
    check-cast v3, Landroid/content/res/XResForwarder;

    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 473
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 474
    .local v0, "repId":I
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    goto :goto_12

    .line 476
    .end local v0    # "repId":I
    .end local v1    # "repRes":Landroid/content/res/Resources;
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_29
    invoke-super {p0, p1}, Landroid/content/res/MiuiResources;->getDimension(I)F

    move-result v3

    goto :goto_12
.end method

.method public getDimensionPixelOffset(I)I
    .registers 6
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 481
    invoke-direct {p0, p1}, Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;

    move-result-object v2

    .line 482
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v3, v2, Landroid/content/res/XResources$DimensionReplacement;

    if-eqz v3, :cond_13

    .line 483
    check-cast v2, Landroid/content/res/XResources$DimensionReplacement;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/content/res/XResources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/res/XResources$DimensionReplacement;->getDimensionPixelOffset(Landroid/util/DisplayMetrics;)I

    move-result v3

    .line 489
    :goto_12
    return v3

    .line 484
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_13
    instance-of v3, v2, Landroid/content/res/XResForwarder;

    if-eqz v3, :cond_29

    move-object v3, v2

    .line 485
    check-cast v3, Landroid/content/res/XResForwarder;

    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 486
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 487
    .local v0, "repId":I
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v3

    goto :goto_12

    .line 489
    .end local v0    # "repId":I
    .end local v1    # "repRes":Landroid/content/res/Resources;
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_29
    invoke-super {p0, p1}, Landroid/content/res/MiuiResources;->getDimensionPixelOffset(I)I

    move-result v3

    goto :goto_12
.end method

.method public getDimensionPixelSize(I)I
    .registers 6
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 494
    invoke-direct {p0, p1}, Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;

    move-result-object v2

    .line 495
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v3, v2, Landroid/content/res/XResources$DimensionReplacement;

    if-eqz v3, :cond_13

    .line 496
    check-cast v2, Landroid/content/res/XResources$DimensionReplacement;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/content/res/XResources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/res/XResources$DimensionReplacement;->getDimensionPixelSize(Landroid/util/DisplayMetrics;)I

    move-result v3

    .line 502
    :goto_12
    return v3

    .line 497
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_13
    instance-of v3, v2, Landroid/content/res/XResForwarder;

    if-eqz v3, :cond_29

    move-object v3, v2

    .line 498
    check-cast v3, Landroid/content/res/XResForwarder;

    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 499
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 500
    .local v0, "repId":I
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    goto :goto_12

    .line 502
    .end local v0    # "repId":I
    .end local v1    # "repRes":Landroid/content/res/Resources;
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_29
    invoke-super {p0, p1}, Landroid/content/res/MiuiResources;->getDimensionPixelSize(I)I

    move-result v3

    goto :goto_12
.end method

.method public getDrawable(I)Landroid/graphics/drawable/Drawable;
    .registers 8
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 507
    invoke-direct {p0, p1}, Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;

    move-result-object v2

    .line 508
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v5, v2, Landroid/content/res/XResources$DrawableLoader;

    if-eqz v5, :cond_1a

    .line 510
    :try_start_8
    check-cast v2, Landroid/content/res/XResources$DrawableLoader;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2, p0, p1}, Landroid/content/res/XResources$DrawableLoader;->newDrawable(Landroid/content/res/XResources;I)Landroid/graphics/drawable/Drawable;
    :try_end_d
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_d} :catch_11

    move-result-object v3

    .line 511
    .local v3, "result":Landroid/graphics/drawable/Drawable;
    if-eqz v3, :cond_15

    .line 521
    .end local v3    # "result":Landroid/graphics/drawable/Drawable;
    :goto_10
    return-object v3

    .line 513
    :catch_11
    move-exception v4

    .local v4, "t":Ljava/lang/Throwable;
    invoke-static {v4}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 521
    .end local v4    # "t":Ljava/lang/Throwable;
    :cond_15
    invoke-super {p0, p1}, Landroid/content/res/MiuiResources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    goto :goto_10

    .line 514
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_1a
    instance-of v5, v2, Ljava/lang/Integer;

    if-eqz v5, :cond_2a

    .line 515
    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    check-cast v2, Ljava/lang/Integer;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-direct {v3, v5}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    goto :goto_10

    .line 516
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_2a
    instance-of v5, v2, Landroid/content/res/XResForwarder;

    if-eqz v5, :cond_15

    move-object v5, v2

    .line 517
    check-cast v5, Landroid/content/res/XResForwarder;

    invoke-virtual {v5}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 518
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 519
    .local v0, "repId":I
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    goto :goto_10
.end method

.method public getDrawableForDensity(II)Landroid/graphics/drawable/Drawable;
    .registers 9
    .param p1, "id"    # I
    .param p2, "density"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 526
    invoke-direct {p0, p1}, Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;

    move-result-object v2

    .line 527
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v5, v2, Landroid/content/res/XResources$DrawableLoader;

    if-eqz v5, :cond_1a

    .line 529
    :try_start_8
    check-cast v2, Landroid/content/res/XResources$DrawableLoader;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2, p0, p1, p2}, Landroid/content/res/XResources$DrawableLoader;->newDrawableForDensity(Landroid/content/res/XResources;II)Landroid/graphics/drawable/Drawable;
    :try_end_d
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_d} :catch_11

    move-result-object v3

    .line 530
    .local v3, "result":Landroid/graphics/drawable/Drawable;
    if-eqz v3, :cond_15

    .line 540
    .end local v3    # "result":Landroid/graphics/drawable/Drawable;
    :goto_10
    return-object v3

    .line 532
    :catch_11
    move-exception v4

    .local v4, "t":Ljava/lang/Throwable;
    invoke-static {v4}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 540
    .end local v4    # "t":Ljava/lang/Throwable;
    :cond_15
    invoke-super {p0, p1, p2}, Landroid/content/res/MiuiResources;->getDrawableForDensity(II)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    goto :goto_10

    .line 533
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_1a
    instance-of v5, v2, Ljava/lang/Integer;

    if-eqz v5, :cond_2a

    .line 534
    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    check-cast v2, Ljava/lang/Integer;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-direct {v3, v5}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    goto :goto_10

    .line 535
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_2a
    instance-of v5, v2, Landroid/content/res/XResForwarder;

    if-eqz v5, :cond_15

    move-object v5, v2

    .line 536
    check-cast v5, Landroid/content/res/XResForwarder;

    invoke-virtual {v5}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 537
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 538
    .local v0, "repId":I
    invoke-virtual {v1, v0, p2}, Landroid/content/res/Resources;->getDrawableForDensity(II)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    goto :goto_10
.end method

.method public getFraction(III)F
    .registers 8
    .param p1, "id"    # I
    .param p2, "base"    # I
    .param p3, "pbase"    # I

    .prologue
    .line 545
    invoke-direct {p0, p1}, Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;

    move-result-object v2

    .line 546
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v3, v2, Landroid/content/res/XResForwarder;

    if-eqz v3, :cond_1a

    move-object v3, v2

    .line 547
    check-cast v3, Landroid/content/res/XResForwarder;

    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 548
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 549
    .local v0, "repId":I
    invoke-virtual {v1, v0, p2, p3}, Landroid/content/res/Resources;->getFraction(III)F

    move-result v3

    .line 551
    .end local v0    # "repId":I
    .end local v1    # "repRes":Landroid/content/res/Resources;
    :goto_19
    return v3

    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_1a
    invoke-super {p0, p1, p2, p3}, Landroid/content/res/MiuiResources;->getFraction(III)F

    move-result v3

    goto :goto_19
.end method

.method public getIntArray(I)[I
    .registers 6
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 569
    invoke-direct {p0, p1}, Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;

    move-result-object v2

    .line 570
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v3, v2, [I

    if-eqz v3, :cond_b

    .line 571
    check-cast v2, [I

    .line 577
    .end local v2    # "replacement":Ljava/lang/Object;
    :goto_a
    return-object v2

    .line 572
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_b
    instance-of v3, v2, Landroid/content/res/XResForwarder;

    if-eqz v3, :cond_21

    move-object v3, v2

    .line 573
    check-cast v3, Landroid/content/res/XResForwarder;

    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 574
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 575
    .local v0, "repId":I
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object v2

    goto :goto_a

    .line 577
    .end local v0    # "repId":I
    .end local v1    # "repRes":Landroid/content/res/Resources;
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_21
    invoke-super {p0, p1}, Landroid/content/res/MiuiResources;->getIntArray(I)[I

    move-result-object v2

    goto :goto_a
.end method

.method public getInteger(I)I
    .registers 6
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 556
    invoke-direct {p0, p1}, Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;

    move-result-object v2

    .line 557
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v3, v2, Ljava/lang/Integer;

    if-eqz v3, :cond_f

    .line 558
    check-cast v2, Ljava/lang/Integer;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 564
    :goto_e
    return v3

    .line 559
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_f
    instance-of v3, v2, Landroid/content/res/XResForwarder;

    if-eqz v3, :cond_25

    move-object v3, v2

    .line 560
    check-cast v3, Landroid/content/res/XResForwarder;

    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 561
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 562
    .local v0, "repId":I
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v3

    goto :goto_e

    .line 564
    .end local v0    # "repId":I
    .end local v1    # "repRes":Landroid/content/res/Resources;
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_25
    invoke-super {p0, p1}, Landroid/content/res/MiuiResources;->getInteger(I)I

    move-result v3

    goto :goto_e
.end method

.method public getLayout(I)Landroid/content/res/XmlResourceParser;
    .registers 24
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 583
    invoke-direct/range {p0 .. p1}, Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;

    move-result-object v15

    .line 584
    .local v15, "replacement":Ljava/lang/Object;
    instance-of v4, v15, Landroid/content/res/XResForwarder;

    if-eqz v4, :cond_d5

    move-object v4, v15

    .line 585
    check-cast v4, Landroid/content/res/XResForwarder;

    invoke-virtual {v4}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    .line 586
    .local v14, "repRes":Landroid/content/res/Resources;
    check-cast v15, Landroid/content/res/XResForwarder;

    .end local v15    # "replacement":Ljava/lang/Object;
    invoke-virtual {v15}, Landroid/content/res/XResForwarder;->getId()I

    move-result v13

    .line 588
    .local v13, "repId":I
    invoke-static {v14, v13}, Landroid/content/res/XResources;->isXmlCached(Landroid/content/res/Resources;I)Z

    move-result v11

    .line 589
    .local v11, "loadedFromCache":Z
    invoke-virtual {v14, v13}, Landroid/content/res/Resources;->getLayout(I)Landroid/content/res/XmlResourceParser;

    move-result-object v17

    .line 591
    .local v17, "result":Landroid/content/res/XmlResourceParser;
    if-nez v11, :cond_2c

    .line 592
    const-string v4, "mParseState"

    move-object/from16 v0, v17

    invoke-static {v0, v4}, Lde/robv/android/xposed/XposedHelpers;->getIntField(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v12

    .line 593
    .local v12, "parseState":I
    move-object/from16 v0, p0

    invoke-static {v12, v0, v14}, Landroid/content/res/XResources;->rewriteXmlReferencesNative(ILandroid/content/res/XResources;Landroid/content/res/Resources;)V

    .line 601
    .end local v11    # "loadedFromCache":Z
    .end local v12    # "parseState":I
    .end local v13    # "repId":I
    .end local v14    # "repRes":Landroid/content/res/Resources;
    :cond_2c
    :goto_2c
    sget-object v5, Landroid/content/res/XResources;->sLayoutCallbacks:Landroid/util/SparseArray;

    monitor-enter v5

    .line 602
    :try_start_2f
    sget-object v4, Landroid/content/res/XResources;->sLayoutCallbacks:Landroid/util/SparseArray;

    move/from16 v0, p1

    invoke-virtual {v4, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/HashMap;

    .line 601
    .local v10, "inner":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/callbacks/XC_LayoutInflated;>;>;"
    monitor-exit v5
    :try_end_3a
    .catchall {:try_start_2f .. :try_end_3a} :catchall_db

    .line 604
    if-eqz v10, :cond_d4

    .line 606
    monitor-enter v10

    .line 607
    :try_start_3d
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/content/res/XResources;->mResDir:Ljava/lang/String;

    invoke-virtual {v10, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    .line 608
    .local v7, "callbacks":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/callbacks/XC_LayoutInflated;>;"
    if-nez v7, :cond_56

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/content/res/XResources;->mResDir:Ljava/lang/String;

    if-eqz v4, :cond_56

    .line 609
    const/4 v4, 0x0

    invoke-virtual {v10, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .end local v7    # "callbacks":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/callbacks/XC_LayoutInflated;>;"
    check-cast v7, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    .line 606
    .restart local v7    # "callbacks":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/callbacks/XC_LayoutInflated;>;"
    :cond_56
    monitor-exit v10
    :try_end_57
    .catchall {:try_start_3d .. :try_end_57} :catchall_de

    .line 611
    if-eqz v7, :cond_d4

    .line 612
    const-string v6, "layout"

    .line 613
    .local v6, "variant":Ljava/lang/String;
    const-string v4, "mTmpValue"

    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lde/robv/android/xposed/XposedHelpers;->getObjectField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Landroid/util/TypedValue;

    .line 614
    .local v19, "value":Landroid/util/TypedValue;
    const/4 v4, 0x1

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2, v4}, Landroid/content/res/XResources;->getValue(ILandroid/util/TypedValue;Z)V

    .line 615
    move-object/from16 v0, v19

    iget v4, v0, Landroid/util/TypedValue;->type:I

    const/4 v5, 0x3

    if-ne v4, v5, :cond_10a

    .line 616
    move-object/from16 v0, v19

    iget-object v4, v0, Landroid/util/TypedValue;->string:Ljava/lang/CharSequence;

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "/"

    const/4 v8, 0x3

    invoke-virtual {v4, v5, v8}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v9

    .line 617
    .local v9, "components":[Ljava/lang/String;
    array-length v4, v9

    const/4 v5, 0x3

    if-ne v4, v5, :cond_e1

    .line 618
    const/4 v4, 0x1

    aget-object v6, v9, v4

    .line 626
    .end local v9    # "components":[Ljava/lang/String;
    :goto_8c
    sget-object v20, Landroid/content/res/XResources;->sXmlInstanceDetails:Ljava/util/WeakHashMap;

    monitor-enter v20

    .line 627
    :try_start_8f
    sget-object v21, Landroid/content/res/XResources;->sResourceNames:Landroid/util/SparseArray;

    monitor-enter v21
    :try_end_92
    .catchall {:try_start_8f .. :try_end_92} :catchall_131

    .line 628
    :try_start_92
    sget-object v4, Landroid/content/res/XResources;->sResourceNames:Landroid/util/SparseArray;

    move/from16 v0, p1

    invoke-virtual {v4, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/util/HashMap;

    .line 629
    .local v16, "resNamesInner":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Landroid/content/res/XResources$ResourceNames;>;"
    if-eqz v16, :cond_d2

    .line 630
    monitor-enter v16
    :try_end_9f
    .catchall {:try_start_92 .. :try_end_9f} :catchall_12e

    .line 631
    :try_start_9f
    new-instance v3, Landroid/content/res/XResources$XMLInstanceDetails;

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/content/res/XResources;->mResDir:Ljava/lang/String;

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/res/XResources$ResourceNames;

    const/4 v8, 0x0

    move-object/from16 v4, p0

    invoke-direct/range {v3 .. v8}, Landroid/content/res/XResources$XMLInstanceDetails;-><init>(Landroid/content/res/XResources;Landroid/content/res/XResources$ResourceNames;Ljava/lang/String;Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;Landroid/content/res/XResources$XMLInstanceDetails;)V

    .line 632
    .local v3, "details":Landroid/content/res/XResources$XMLInstanceDetails;
    sget-object v4, Landroid/content/res/XResources;->sXmlInstanceDetails:Ljava/util/WeakHashMap;

    move-object/from16 v0, v17

    invoke-virtual {v4, v0, v3}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 635
    sget-object v4, Landroid/content/res/XResources;->sIncludedLayouts:Ljava/lang/ThreadLocal;

    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/LinkedList;

    invoke-virtual {v4}, Ljava/util/LinkedList;->peek()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;

    .line 636
    .local v18, "top":Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;
    if-eqz v18, :cond_d1

    .line 637
    const-string v4, "xmlInstanceDetails"

    move-object/from16 v0, v18

    invoke-virtual {v0, v4, v3}, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->setObjectExtra(Ljava/lang/String;Ljava/lang/Object;)V

    .line 630
    :cond_d1
    monitor-exit v16
    :try_end_d2
    .catchall {:try_start_9f .. :try_end_d2} :catchall_12b

    .line 627
    .end local v3    # "details":Landroid/content/res/XResources$XMLInstanceDetails;
    .end local v18    # "top":Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;
    :cond_d2
    :try_start_d2
    monitor-exit v21
    :try_end_d3
    .catchall {:try_start_d2 .. :try_end_d3} :catchall_12e

    .line 626
    :try_start_d3
    monitor-exit v20
    :try_end_d4
    .catchall {:try_start_d3 .. :try_end_d4} :catchall_131

    .line 645
    .end local v6    # "variant":Ljava/lang/String;
    .end local v7    # "callbacks":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/callbacks/XC_LayoutInflated;>;"
    .end local v16    # "resNamesInner":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Landroid/content/res/XResources$ResourceNames;>;"
    .end local v19    # "value":Landroid/util/TypedValue;
    :cond_d4
    return-object v17

    .line 596
    .end local v10    # "inner":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/callbacks/XC_LayoutInflated;>;>;"
    .end local v17    # "result":Landroid/content/res/XmlResourceParser;
    .restart local v15    # "replacement":Ljava/lang/Object;
    :cond_d5
    invoke-super/range {p0 .. p1}, Landroid/content/res/MiuiResources;->getLayout(I)Landroid/content/res/XmlResourceParser;

    move-result-object v17

    .restart local v17    # "result":Landroid/content/res/XmlResourceParser;
    goto/16 :goto_2c

    .line 601
    .end local v15    # "replacement":Ljava/lang/Object;
    :catchall_db
    move-exception v4

    :try_start_dc
    monitor-exit v5
    :try_end_dd
    .catchall {:try_start_dc .. :try_end_dd} :catchall_db

    throw v4

    .line 606
    .restart local v10    # "inner":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/callbacks/XC_LayoutInflated;>;>;"
    :catchall_de
    move-exception v4

    :try_start_df
    monitor-exit v10
    :try_end_e0
    .catchall {:try_start_df .. :try_end_e0} :catchall_de

    throw v4

    .line 620
    .restart local v6    # "variant":Ljava/lang/String;
    .restart local v7    # "callbacks":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/callbacks/XC_LayoutInflated;>;"
    .restart local v9    # "components":[Ljava/lang/String;
    .restart local v19    # "value":Landroid/util/TypedValue;
    :cond_e1
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Unexpected resource path \""

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v19

    iget-object v5, v0, Landroid/util/TypedValue;->string:Ljava/lang/CharSequence;

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 621
    const-string v5, "\" for resource id 0x"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 620
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    goto :goto_8c

    .line 623
    .end local v9    # "components":[Ljava/lang/String;
    :cond_10a
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v5, Landroid/content/res/Resources$NotFoundException;

    const-string v8, "Could not find file name for resource id 0x"

    invoke-direct {v5, v8}, Landroid/content/res/Resources$NotFoundException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    goto/16 :goto_8c

    .line 630
    .restart local v16    # "resNamesInner":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Landroid/content/res/XResources$ResourceNames;>;"
    :catchall_12b
    move-exception v4

    :try_start_12c
    monitor-exit v16
    :try_end_12d
    .catchall {:try_start_12c .. :try_end_12d} :catchall_12b

    :try_start_12d
    throw v4

    .line 627
    .end local v16    # "resNamesInner":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Landroid/content/res/XResources$ResourceNames;>;"
    :catchall_12e
    move-exception v4

    monitor-exit v21
    :try_end_130
    .catchall {:try_start_12d .. :try_end_130} :catchall_12e

    :try_start_130
    throw v4

    .line 626
    :catchall_131
    move-exception v4

    monitor-exit v20
    :try_end_133
    .catchall {:try_start_130 .. :try_end_133} :catchall_131

    throw v4
.end method

.method public getMovie(I)Landroid/graphics/Movie;
    .registers 6
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 650
    invoke-direct {p0, p1}, Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;

    move-result-object v2

    .line 651
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v3, v2, Landroid/content/res/XResForwarder;

    if-eqz v3, :cond_1a

    move-object v3, v2

    .line 652
    check-cast v3, Landroid/content/res/XResForwarder;

    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 653
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 654
    .local v0, "repId":I
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getMovie(I)Landroid/graphics/Movie;

    move-result-object v3

    .line 656
    .end local v0    # "repId":I
    .end local v1    # "repRes":Landroid/content/res/Resources;
    :goto_19
    return-object v3

    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_1a
    invoke-super {p0, p1}, Landroid/content/res/MiuiResources;->getMovie(I)Landroid/graphics/Movie;

    move-result-object v3

    goto :goto_19
.end method

.method public getPackageName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 136
    iget-object v0, p0, Landroid/content/res/XResources;->mPackageName:Ljava/lang/String;

    return-object v0
.end method

.method public getQuantityText(II)Ljava/lang/CharSequence;
    .registers 7
    .param p1, "id"    # I
    .param p2, "quantity"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 661
    invoke-direct {p0, p1}, Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;

    move-result-object v2

    .line 662
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v3, v2, Landroid/content/res/XResForwarder;

    if-eqz v3, :cond_1a

    move-object v3, v2

    .line 663
    check-cast v3, Landroid/content/res/XResForwarder;

    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 664
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 665
    .local v0, "repId":I
    invoke-virtual {v1, v0, p2}, Landroid/content/res/Resources;->getQuantityText(II)Ljava/lang/CharSequence;

    move-result-object v3

    .line 667
    .end local v0    # "repId":I
    .end local v1    # "repRes":Landroid/content/res/Resources;
    :goto_19
    return-object v3

    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_1a
    invoke-super {p0, p1, p2}, Landroid/content/res/MiuiResources;->getQuantityText(II)Ljava/lang/CharSequence;

    move-result-object v3

    goto :goto_19
.end method

.method public getResDir()Ljava/lang/String;
    .registers 2

    .prologue
    .line 122
    iget-object v0, p0, Landroid/content/res/XResources;->mResDir:Ljava/lang/String;

    return-object v0
.end method

.method public getStringArray(I)[Ljava/lang/String;
    .registers 6
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 675
    invoke-direct {p0, p1}, Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;

    move-result-object v2

    .line 676
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v3, v2, [Ljava/lang/String;

    if-eqz v3, :cond_b

    .line 677
    check-cast v2, [Ljava/lang/String;

    .line 683
    .end local v2    # "replacement":Ljava/lang/Object;
    :goto_a
    return-object v2

    .line 678
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_b
    instance-of v3, v2, Landroid/content/res/XResForwarder;

    if-eqz v3, :cond_21

    move-object v3, v2

    .line 679
    check-cast v3, Landroid/content/res/XResForwarder;

    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 680
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 681
    .local v0, "repId":I
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    goto :goto_a

    .line 683
    .end local v0    # "repId":I
    .end local v1    # "repRes":Landroid/content/res/Resources;
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_21
    invoke-super {p0, p1}, Landroid/content/res/MiuiResources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    goto :goto_a
.end method

.method public getText(I)Ljava/lang/CharSequence;
    .registers 6
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 688
    invoke-direct {p0, p1}, Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;

    move-result-object v2

    .line 689
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v3, v2, Ljava/lang/CharSequence;

    if-eqz v3, :cond_b

    .line 690
    check-cast v2, Ljava/lang/CharSequence;

    .line 696
    .end local v2    # "replacement":Ljava/lang/Object;
    :goto_a
    return-object v2

    .line 691
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_b
    instance-of v3, v2, Landroid/content/res/XResForwarder;

    if-eqz v3, :cond_21

    move-object v3, v2

    .line 692
    check-cast v3, Landroid/content/res/XResForwarder;

    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 693
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 694
    .local v0, "repId":I
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    goto :goto_a

    .line 696
    .end local v0    # "repId":I
    .end local v1    # "repRes":Landroid/content/res/Resources;
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_21
    invoke-super {p0, p1}, Landroid/content/res/MiuiResources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    goto :goto_a
.end method

.method public getText(ILjava/lang/CharSequence;)Ljava/lang/CharSequence;
    .registers 7
    .param p1, "id"    # I
    .param p2, "def"    # Ljava/lang/CharSequence;

    .prologue
    .line 704
    invoke-direct {p0, p1}, Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;

    move-result-object v2

    .line 705
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v3, v2, Ljava/lang/CharSequence;

    if-eqz v3, :cond_b

    .line 706
    check-cast v2, Ljava/lang/CharSequence;

    .line 712
    .end local v2    # "replacement":Ljava/lang/Object;
    :goto_a
    return-object v2

    .line 707
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_b
    instance-of v3, v2, Landroid/content/res/XResForwarder;

    if-eqz v3, :cond_21

    move-object v3, v2

    .line 708
    check-cast v3, Landroid/content/res/XResForwarder;

    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 709
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 710
    .local v0, "repId":I
    invoke-virtual {v1, v0, p2}, Landroid/content/res/Resources;->getText(ILjava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    goto :goto_a

    .line 712
    .end local v0    # "repId":I
    .end local v1    # "repRes":Landroid/content/res/Resources;
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_21
    invoke-super {p0, p1, p2}, Landroid/content/res/MiuiResources;->getText(ILjava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    goto :goto_a
.end method

.method public getTextArray(I)[Ljava/lang/CharSequence;
    .registers 6
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 717
    invoke-direct {p0, p1}, Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;

    move-result-object v2

    .line 718
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v3, v2, [Ljava/lang/CharSequence;

    if-eqz v3, :cond_b

    .line 719
    check-cast v2, [Ljava/lang/CharSequence;

    .line 725
    .end local v2    # "replacement":Ljava/lang/Object;
    :goto_a
    return-object v2

    .line 720
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_b
    instance-of v3, v2, Landroid/content/res/XResForwarder;

    if-eqz v3, :cond_21

    move-object v3, v2

    .line 721
    check-cast v3, Landroid/content/res/XResForwarder;

    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 722
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 723
    .local v0, "repId":I
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v2

    goto :goto_a

    .line 725
    .end local v0    # "repId":I
    .end local v1    # "repRes":Landroid/content/res/Resources;
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_21
    invoke-super {p0, p1}, Landroid/content/res/MiuiResources;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v2

    goto :goto_a
.end method

.method public getXml(I)Landroid/content/res/XmlResourceParser;
    .registers 9
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 730
    invoke-direct {p0, p1}, Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;

    move-result-object v4

    .line 731
    .local v4, "replacement":Ljava/lang/Object;
    instance-of v6, v4, Landroid/content/res/XResForwarder;

    if-eqz v6, :cond_29

    move-object v6, v4

    .line 732
    check-cast v6, Landroid/content/res/XResForwarder;

    invoke-virtual {v6}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 733
    .local v3, "repRes":Landroid/content/res/Resources;
    check-cast v4, Landroid/content/res/XResForwarder;

    .end local v4    # "replacement":Ljava/lang/Object;
    invoke-virtual {v4}, Landroid/content/res/XResForwarder;->getId()I

    move-result v2

    .line 735
    .local v2, "repId":I
    invoke-static {v3, v2}, Landroid/content/res/XResources;->isXmlCached(Landroid/content/res/Resources;I)Z

    move-result v0

    .line 736
    .local v0, "loadedFromCache":Z
    invoke-virtual {v3, v2}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v5

    .line 738
    .local v5, "result":Landroid/content/res/XmlResourceParser;
    if-nez v0, :cond_28

    .line 739
    const-string v6, "mParseState"

    invoke-static {v5, v6}, Lde/robv/android/xposed/XposedHelpers;->getIntField(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v1

    .line 740
    .local v1, "parseState":I
    invoke-static {v1, p0, v3}, Landroid/content/res/XResources;->rewriteXmlReferencesNative(ILandroid/content/res/XResources;Landroid/content/res/Resources;)V

    .line 745
    .end local v0    # "loadedFromCache":Z
    .end local v1    # "parseState":I
    .end local v2    # "repId":I
    .end local v3    # "repRes":Landroid/content/res/Resources;
    .end local v5    # "result":Landroid/content/res/XmlResourceParser;
    :cond_28
    :goto_28
    return-object v5

    .restart local v4    # "replacement":Ljava/lang/Object;
    :cond_29
    invoke-super {p0, p1}, Landroid/content/res/MiuiResources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v5

    goto :goto_28
.end method

.method public hookLayout(ILde/robv/android/xposed/callbacks/XC_LayoutInflated;)Lde/robv/android/xposed/callbacks/XC_LayoutInflated$Unhook;
    .registers 5
    .param p1, "id"    # I
    .param p2, "callback"    # Lde/robv/android/xposed/callbacks/XC_LayoutInflated;

    .prologue
    .line 1157
    iget-object v0, p0, Landroid/content/res/XResources;->mResDir:Ljava/lang/String;

    invoke-direct {p0, p1}, Landroid/content/res/XResources;->getResourceNames(I)Landroid/content/res/XResources$ResourceNames;

    move-result-object v1

    invoke-static {v0, p1, v1, p2}, Landroid/content/res/XResources;->hookLayoutInternal(Ljava/lang/String;ILandroid/content/res/XResources$ResourceNames;Lde/robv/android/xposed/callbacks/XC_LayoutInflated;)Lde/robv/android/xposed/callbacks/XC_LayoutInflated$Unhook;

    move-result-object v0

    return-object v0
.end method

.method public hookLayout(Ljava/lang/String;Lde/robv/android/xposed/callbacks/XC_LayoutInflated;)Lde/robv/android/xposed/callbacks/XC_LayoutInflated$Unhook;
    .registers 5
    .param p1, "fullName"    # Ljava/lang/String;
    .param p2, "callback"    # Lde/robv/android/xposed/callbacks/XC_LayoutInflated;

    .prologue
    const/4 v1, 0x0

    .line 1162
    invoke-virtual {p0, p1, v1, v1}, Landroid/content/res/XResources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 1163
    .local v0, "id":I
    if-nez v0, :cond_d

    .line 1164
    new-instance v1, Landroid/content/res/Resources$NotFoundException;

    invoke-direct {v1, p1}, Landroid/content/res/Resources$NotFoundException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1165
    :cond_d
    invoke-virtual {p0, v0, p2}, Landroid/content/res/XResources;->hookLayout(ILde/robv/android/xposed/callbacks/XC_LayoutInflated;)Lde/robv/android/xposed/callbacks/XC_LayoutInflated$Unhook;

    move-result-object v1

    return-object v1
.end method

.method public hookLayout(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lde/robv/android/xposed/callbacks/XC_LayoutInflated;)Lde/robv/android/xposed/callbacks/XC_LayoutInflated$Unhook;
    .registers 9
    .param p1, "pkg"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "callback"    # Lde/robv/android/xposed/callbacks/XC_LayoutInflated;

    .prologue
    .line 1176
    invoke-virtual {p0, p3, p2, p1}, Landroid/content/res/XResources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 1177
    .local v0, "id":I
    if-nez v0, :cond_2d

    .line 1178
    new-instance v1, Landroid/content/res/Resources$NotFoundException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/content/res/Resources$NotFoundException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1179
    :cond_2d
    invoke-virtual {p0, v0, p4}, Landroid/content/res/XResources;->hookLayout(ILde/robv/android/xposed/callbacks/XC_LayoutInflated;)Lde/robv/android/xposed/callbacks/XC_LayoutInflated$Unhook;

    move-result-object v1

    return-object v1
.end method

.method public initObject(Ljava/lang/String;)V
    .registers 5
    .param p1, "resDir"    # Ljava/lang/String;

    .prologue
    .line 77
    iget-boolean v0, p0, Landroid/content/res/XResources;->mIsObjectInited:Z

    if-eqz v0, :cond_c

    .line 78
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Object has already been initialized"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 80
    :cond_c
    iput-object p1, p0, Landroid/content/res/XResources;->mResDir:Ljava/lang/String;

    .line 81
    invoke-static {p1}, Landroid/content/res/XResources;->getPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/content/res/XResources;->mPackageName:Ljava/lang/String;

    .line 83
    if-eqz p1, :cond_35

    .line 84
    sget-object v1, Landroid/content/res/XResources;->sReplacementsCacheMap:Ljava/util/HashMap;

    monitor-enter v1

    .line 85
    :try_start_19
    sget-object v0, Landroid/content/res/XResources;->sReplacementsCacheMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    iput-object v0, p0, Landroid/content/res/XResources;->mReplacementsCache:[B

    .line 86
    iget-object v0, p0, Landroid/content/res/XResources;->mReplacementsCache:[B

    if-nez v0, :cond_34

    .line 87
    const/16 v0, 0x80

    new-array v0, v0, [B

    iput-object v0, p0, Landroid/content/res/XResources;->mReplacementsCache:[B

    .line 88
    sget-object v0, Landroid/content/res/XResources;->sReplacementsCacheMap:Ljava/util/HashMap;

    iget-object v2, p0, Landroid/content/res/XResources;->mReplacementsCache:[B

    invoke-virtual {v0, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    :cond_34
    monitor-exit v1
    :try_end_35
    .catchall {:try_start_19 .. :try_end_35} :catchall_39

    .line 93
    :cond_35
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/content/res/XResources;->mIsObjectInited:Z

    .line 94
    return-void

    .line 84
    :catchall_39
    move-exception v0

    :try_start_3a
    monitor-exit v1
    :try_end_3b
    .catchall {:try_start_3a .. :try_end_3b} :catchall_39

    throw v0
.end method

.method public isFirstLoad()Z
    .registers 9

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 98
    sget-object v5, Landroid/content/res/XResources;->sReplacements:Landroid/util/SparseArray;

    monitor-enter v5

    .line 99
    :try_start_5
    iget-object v6, p0, Landroid/content/res/XResources;->mResDir:Ljava/lang/String;

    if-nez v6, :cond_b

    .line 100
    monitor-exit v5

    .line 117
    :goto_a
    return v3

    .line 102
    :cond_b
    new-instance v6, Ljava/io/File;

    iget-object v7, p0, Landroid/content/res/XResources;->mResDir:Ljava/lang/String;

    invoke-direct {v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 103
    .local v1, "lastModification":Ljava/lang/Long;
    sget-object v6, Landroid/content/res/XResources;->sResDirLastModified:Ljava/util/HashMap;

    iget-object v7, p0, Landroid/content/res/XResources;->mResDir:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    .line 104
    .local v2, "oldModified":Ljava/lang/Long;
    invoke-virtual {v1, v2}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2f

    .line 105
    monitor-exit v5

    goto :goto_a

    .line 98
    .end local v1    # "lastModification":Ljava/lang/Long;
    .end local v2    # "oldModified":Ljava/lang/Long;
    :catchall_2c
    move-exception v3

    monitor-exit v5
    :try_end_2e
    .catchall {:try_start_5 .. :try_end_2e} :catchall_2c

    throw v3

    .line 107
    .restart local v1    # "lastModification":Ljava/lang/Long;
    .restart local v2    # "oldModified":Ljava/lang/Long;
    :cond_2f
    :try_start_2f
    sget-object v3, Landroid/content/res/XResources;->sResDirLastModified:Ljava/util/HashMap;

    iget-object v6, p0, Landroid/content/res/XResources;->mResDir:Ljava/lang/String;

    invoke-virtual {v3, v6, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    if-nez v2, :cond_3b

    .line 110
    monitor-exit v5

    move v3, v4

    goto :goto_a

    .line 113
    :cond_3b
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3c
    sget-object v3, Landroid/content/res/XResources;->sReplacements:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v3

    if-lt v0, v3, :cond_4d

    .line 116
    iget-object v3, p0, Landroid/content/res/XResources;->mReplacementsCache:[B

    const/4 v6, 0x0

    invoke-static {v3, v6}, Ljava/util/Arrays;->fill([BB)V

    .line 117
    monitor-exit v5

    move v3, v4

    goto :goto_a

    .line 114
    :cond_4d
    sget-object v3, Landroid/content/res/XResources;->sReplacements:Landroid/util/SparseArray;

    invoke-virtual {v3, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    iget-object v6, p0, Landroid/content/res/XResources;->mResDir:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5a
    .catchall {:try_start_2f .. :try_end_5a} :catchall_2c

    .line 113
    add-int/lit8 v0, v0, 0x1

    goto :goto_3c
.end method

.method public setReplacement(ILjava/lang/Object;)V
    .registers 3
    .param p1, "id"    # I
    .param p2, "replacement"    # Ljava/lang/Object;

    .prologue
    .line 294
    invoke-static {p1, p2, p0}, Landroid/content/res/XResources;->setReplacement(ILjava/lang/Object;Landroid/content/res/XResources;)V

    .line 295
    return-void
.end method

.method public setReplacement(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 5
    .param p1, "fullName"    # Ljava/lang/String;
    .param p2, "replacement"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 298
    invoke-virtual {p0, p1, v1, v1}, Landroid/content/res/XResources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 299
    .local v0, "id":I
    if-nez v0, :cond_d

    .line 300
    new-instance v1, Landroid/content/res/Resources$NotFoundException;

    invoke-direct {v1, p1}, Landroid/content/res/Resources$NotFoundException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 301
    :cond_d
    invoke-static {v0, p2, p0}, Landroid/content/res/XResources;->setReplacement(ILjava/lang/Object;Landroid/content/res/XResources;)V

    .line 302
    return-void
.end method

.method public setReplacement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 9
    .param p1, "pkg"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "replacement"    # Ljava/lang/Object;

    .prologue
    .line 305
    invoke-virtual {p0, p3, p2, p1}, Landroid/content/res/XResources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 306
    .local v0, "id":I
    if-nez v0, :cond_2d

    .line 307
    new-instance v1, Landroid/content/res/Resources$NotFoundException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/content/res/Resources$NotFoundException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 308
    :cond_2d
    invoke-static {v0, p4, p0}, Landroid/content/res/XResources;->setReplacement(ILjava/lang/Object;Landroid/content/res/XResources;)V

    .line 309
    return-void
.end method
