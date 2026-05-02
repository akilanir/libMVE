.class public Lpl/droidsonroids/gif/LibraryLoader;
.super Ljava/lang/Object;
.source "LibraryLoader.java"


# static fields
.field static final BASE_LIBRARY_NAME:Ljava/lang/String; = "pl_droidsonroids_gif"

.field static final SURFACE_LIBRARY_NAME:Ljava/lang/String; = "pl_droidsonroids_gif_surface"

.field private static sAppContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getContext()Landroid/content/Context;
    .registers 5

    .prologue
    .line 29
    sget-object v3, Lpl/droidsonroids/gif/LibraryLoader;->sAppContext:Landroid/content/Context;

    if-nez v3, :cond_1f

    .line 31
    :try_start_4
    const-string v3, "android.app.ActivityThread"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 32
    .local v0, "activityThread":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "currentApplication"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 33
    .local v1, "currentApplicationMethod":Ljava/lang/reflect/Method;
    const/4 v3, 0x0

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v1, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/Context;

    sput-object v3, Lpl/droidsonroids/gif/LibraryLoader;->sAppContext:Landroid/content/Context;
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_1f} :catch_22

    .line 38
    :cond_1f
    sget-object v3, Lpl/droidsonroids/gif/LibraryLoader;->sAppContext:Landroid/content/Context;

    return-object v3

    .line 34
    .end local v1    # "currentApplicationMethod":Ljava/lang/reflect/Method;
    :catch_22
    move-exception v2

    .line 35
    .local v2, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "LibraryLoader not initialized. Call LibraryLoader.initialize() before using library classes."

    invoke-direct {v3, v4, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public static initialize(Landroid/content/Context;)V
    .registers 2
    .param p0, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 25
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lpl/droidsonroids/gif/LibraryLoader;->sAppContext:Landroid/content/Context;

    .line 26
    return-void
.end method

.method static loadLibrary(Landroid/content/Context;Ljava/lang/String;)V
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "library"    # Ljava/lang/String;

    .prologue
    .line 43
    :try_start_0
    invoke-static {p1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_3} :catch_4

    .line 57
    :goto_3
    return-void

    .line 44
    :catch_4
    move-exception v0

    .line 45
    .local v0, "e":Ljava/lang/UnsatisfiedLinkError;
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x9

    if-ge v1, v2, :cond_c

    .line 46
    throw v0

    .line 49
    :cond_c
    const-string v1, "pl_droidsonroids_gif_surface"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_19

    .line 50
    const-string v1, "pl_droidsonroids_gif"

    invoke-static {p0, v1}, Lpl/droidsonroids/gif/LibraryLoader;->loadLibrary(Landroid/content/Context;Ljava/lang/String;)V

    .line 52
    :cond_19
    if-nez p0, :cond_1f

    .line 53
    invoke-static {}, Lpl/droidsonroids/gif/LibraryLoader;->getContext()Landroid/content/Context;

    move-result-object p0

    .line 55
    :cond_1f
    invoke-static {p0, p1}, Lpl/droidsonroids/gif/ReLinker;->loadLibrary(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_3
.end method
