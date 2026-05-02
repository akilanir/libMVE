.class public Lorg/piwik/sdk/tools/DeviceHelper;
.super Ljava/lang/Object;
.source "DeviceHelper.java"


# static fields
.field private static final LOGGER_TAG:Ljava/lang/String; = "PIWIK:DeviceHelper"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getResolution(Landroid/content/Context;)[I
    .registers 14
    .param p0, "context"    # Landroid/content/Context;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    const/4 v12, -0x1

    const/4 v11, 0x0

    .line 63
    const/4 v6, -0x1

    .local v6, "width":I
    const/4 v5, -0x1

    .line 67
    .local v5, "height":I
    :try_start_4
    const-string v8, "window"

    invoke-virtual {p0, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/WindowManager;

    .line 68
    .local v7, "wm":Landroid/view/WindowManager;
    invoke-interface {v7}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;
    :try_end_f
    .catch Ljava/lang/NullPointerException; {:try_start_4 .. :try_end_f} :catch_3b

    move-result-object v0

    .line 74
    .local v0, "display":Landroid/view/Display;
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x11

    if-lt v8, v9, :cond_45

    .line 76
    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 77
    .local v1, "dm":Landroid/util/DisplayMetrics;
    invoke-virtual {v0, v1}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    .line 78
    iget v6, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 79
    iget v5, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 92
    .end local v1    # "dm":Landroid/util/DisplayMetrics;
    :cond_22
    :goto_22
    if-eq v6, v12, :cond_26

    if-ne v5, v12, :cond_32

    .line 95
    :cond_26
    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 96
    .restart local v1    # "dm":Landroid/util/DisplayMetrics;
    invoke-virtual {v0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 97
    iget v6, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 98
    iget v5, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 101
    .end local v1    # "dm":Landroid/util/DisplayMetrics;
    :cond_32
    const/4 v8, 0x2

    new-array v8, v8, [I

    aput v6, v8, v11

    const/4 v9, 0x1

    aput v5, v8, v9

    .end local v0    # "display":Landroid/view/Display;
    .end local v7    # "wm":Landroid/view/WindowManager;
    :goto_3a
    return-object v8

    .line 69
    :catch_3b
    move-exception v2

    .line 70
    .local v2, "e":Ljava/lang/NullPointerException;
    const-string v8, "PIWIK:DeviceHelper"

    const-string v9, "Window service was not available from this context"

    invoke-static {v8, v9}, Lorg/piwik/sdk/tools/Logy;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    const/4 v8, 0x0

    goto :goto_3a

    .line 80
    .end local v2    # "e":Ljava/lang/NullPointerException;
    .restart local v0    # "display":Landroid/view/Display;
    .restart local v7    # "wm":Landroid/view/WindowManager;
    :cond_45
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0xe

    if-lt v8, v9, :cond_22

    .line 83
    :try_start_4b
    const-class v8, Landroid/view/Display;

    const-string v9, "getRawWidth"

    const/4 v10, 0x0

    new-array v10, v10, [Ljava/lang/Class;

    invoke-virtual {v8, v9, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 84
    .local v4, "getRawWidth":Ljava/lang/reflect/Method;
    const-class v8, Landroid/view/Display;

    const-string v9, "getRawHeight"

    const/4 v10, 0x0

    new-array v10, v10, [Ljava/lang/Class;

    invoke-virtual {v8, v9, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 85
    .local v3, "getRawHeight":Ljava/lang/reflect/Method;
    const/4 v8, 0x0

    new-array v8, v8, [Ljava/lang/Object;

    invoke-virtual {v4, v0, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 86
    const/4 v8, 0x0

    new-array v8, v8, [Ljava/lang/Object;

    invoke-virtual {v3, v0, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I
    :try_end_7a
    .catch Ljava/lang/Exception; {:try_start_4b .. :try_end_7a} :catch_7c

    move-result v5

    goto :goto_22

    .line 87
    .end local v3    # "getRawHeight":Ljava/lang/reflect/Method;
    .end local v4    # "getRawWidth":Ljava/lang/reflect/Method;
    :catch_7c
    move-exception v2

    .line 88
    .local v2, "e":Ljava/lang/Exception;
    const-string v8, "PIWIK:DeviceHelper"

    const-string v9, "Reflection of getRawWidth/getRawHeight failed on API14-16 unexpectedly."

    invoke-static {v8, v9}, Lorg/piwik/sdk/tools/Logy;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_22
.end method

.method public static getUserAgent()Ljava/lang/String;
    .registers 1

    .prologue
    .line 51
    const-string v0, "http.agent"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getUserCountry()Ljava/lang/String;
    .registers 1

    .prologue
    .line 42
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getUserLanguage()Ljava/lang/String;
    .registers 1

    .prologue
    .line 33
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
