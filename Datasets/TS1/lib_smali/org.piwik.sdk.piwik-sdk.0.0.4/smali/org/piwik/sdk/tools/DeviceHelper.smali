.class public Lorg/piwik/sdk/tools/DeviceHelper;
.super Ljava/lang/Object;
.source "DeviceHelper.java"


# static fields
.field private static final LOGGER_TAG:Ljava/lang/String; = "PIWIK:DeviceHelper"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getResolution(Landroid/content/Context;)[I
    .registers 10
    .param p0, "context"    # Landroid/content/Context;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .line 63
    const/4 v0, -0x1

    .line 63
    .local v0, "width":I
    const/4 v1, -0x1

    move v2, v1

    .line 67
    .local v2, "height":I
    :try_start_3
    const-string v3, "window"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/WindowManager;

    .line 68
    .local v3, "wm":Landroid/view/WindowManager;
    invoke-interface {v3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v4
    :try_end_f
    .catch Ljava/lang/NullPointerException; {:try_start_3 .. :try_end_f} :catch_7c

    .line 68
    .end local v3    # "wm":Landroid/view/WindowManager;
    move-object v3, v4

    .line 72
    .local v3, "display":Landroid/view/Display;
    nop

    .line 71
    nop

    .line 74
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x11

    const/4 v6, 0x0

    if-lt v4, v5, :cond_26

    .line 76
    new-instance v4, Landroid/util/DisplayMetrics;

    invoke-direct {v4}, Landroid/util/DisplayMetrics;-><init>()V

    .line 77
    .local v4, "dm":Landroid/util/DisplayMetrics;
    invoke-virtual {v3, v4}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    .line 78
    iget v0, v4, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 79
    iget v2, v4, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 80
    .end local v4    # "dm":Landroid/util/DisplayMetrics;
    goto :goto_63

    :cond_26
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0xe

    if-lt v4, v5, :cond_63

    .line 83
    :try_start_2c
    const-class v4, Landroid/view/Display;

    const-string v5, "getRawWidth"

    new-array v7, v6, [Ljava/lang/Class;

    invoke-virtual {v4, v5, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 84
    .local v4, "getRawWidth":Ljava/lang/reflect/Method;
    const-class v5, Landroid/view/Display;

    const-string v7, "getRawHeight"

    new-array v8, v6, [Ljava/lang/Class;

    invoke-virtual {v5, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 85
    .local v5, "getRawHeight":Ljava/lang/reflect/Method;
    new-array v7, v6, [Ljava/lang/Object;

    invoke-virtual {v4, v3, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    move v0, v7

    .line 86
    new-array v7, v6, [Ljava/lang/Object;

    invoke-virtual {v5, v3, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7
    :try_end_59
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_59} :catch_5b

    move v2, v7

    .line 89
    .end local v4    # "getRawWidth":Ljava/lang/reflect/Method;
    .end local v5    # "getRawHeight":Ljava/lang/reflect/Method;
    goto :goto_63

    .line 87
    :catch_5b
    move-exception v4

    .line 88
    .local v4, "e":Ljava/lang/Exception;
    const-string v5, "PIWIK:DeviceHelper"

    const-string v7, "Reflection of getRawWidth/getRawHeight failed on API14-16 unexpectedly."

    invoke-static {v5, v7}, Lorg/piwik/sdk/tools/Logy;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_63
    :goto_63
    if-eq v0, v1, :cond_67

    if-ne v2, v1, :cond_73

    .line 95
    :cond_67
    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 96
    .local v1, "dm":Landroid/util/DisplayMetrics;
    invoke-virtual {v3, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 97
    iget v0, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 98
    iget v2, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 101
    .end local v1    # "dm":Landroid/util/DisplayMetrics;
    :cond_73
    const/4 v1, 0x2

    new-array v1, v1, [I

    aput v0, v1, v6

    const/4 v4, 0x1

    aput v2, v1, v4

    return-object v1

    .line 69
    .end local v3    # "display":Landroid/view/Display;
    :catch_7c
    move-exception v1

    .line 70
    .local v1, "e":Ljava/lang/NullPointerException;
    const-string v3, "PIWIK:DeviceHelper"

    const-string v4, "Window service was not available from this context"

    invoke-static {v3, v4}, Lorg/piwik/sdk/tools/Logy;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    const/4 v3, 0x0

    return-object v3
.end method

.method public static getUserAgent()Ljava/lang/String;
    .registers 1

    .line 51
    const-string v0, "http.agent"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getUserCountry()Ljava/lang/String;
    .registers 1

    .line 42
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getUserLanguage()Ljava/lang/String;
    .registers 1

    .line 33
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
