.class public Lcom/lb/material_preferences_library/custom_preferences/PreferenceManagerEx;
.super Ljava/lang/Object;
.source "PreferenceManagerEx.java"


# static fields
.field private static final INSTANCE:Lcom/lb/material_preferences_library/custom_preferences/PreferenceManagerEx;


# instance fields
.field private METHOD_REGISTER_ON_ACTIVITY_DESTROY_LISTENER:Ljava/lang/reflect/Method;

.field private METHOD_UNREGISTER_ON_ACTIVITY_DESTROY_LISTENER:Ljava/lang/reflect/Method;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 11
    new-instance v0, Lcom/lb/material_preferences_library/custom_preferences/PreferenceManagerEx;

    invoke-direct {v0}, Lcom/lb/material_preferences_library/custom_preferences/PreferenceManagerEx;-><init>()V

    sput-object v0, Lcom/lb/material_preferences_library/custom_preferences/PreferenceManagerEx;->INSTANCE:Lcom/lb/material_preferences_library/custom_preferences/PreferenceManagerEx;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    return-void
.end method

.method public static getInstance()Lcom/lb/material_preferences_library/custom_preferences/PreferenceManagerEx;
    .registers 1

    .prologue
    .line 64
    sget-object v0, Lcom/lb/material_preferences_library/custom_preferences/PreferenceManagerEx;->INSTANCE:Lcom/lb/material_preferences_library/custom_preferences/PreferenceManagerEx;

    return-object v0
.end method


# virtual methods
.method public registerOnActivityDestroyListener(Landroid/preference/PreferenceManager;Landroid/preference/PreferenceManager$OnActivityDestroyListener;)V
    .registers 10
    .param p1, "pm"    # Landroid/preference/PreferenceManager;
    .param p2, "listener"    # Landroid/preference/PreferenceManager$OnActivityDestroyListener;

    .prologue
    .line 42
    iget-object v1, p0, Lcom/lb/material_preferences_library/custom_preferences/PreferenceManagerEx;->METHOD_REGISTER_ON_ACTIVITY_DESTROY_LISTENER:Ljava/lang/reflect/Method;

    .line 45
    .local v1, "registerMethod":Ljava/lang/reflect/Method;
    if-nez v1, :cond_1a

    .line 48
    :try_start_4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "registerOnActivityDestroyListener"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/preference/PreferenceManager$OnActivityDestroyListener;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 50
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 52
    :cond_1a
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    invoke-virtual {v1, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_23} :catch_26

    .line 59
    :goto_23
    iput-object v1, p0, Lcom/lb/material_preferences_library/custom_preferences/PreferenceManagerEx;->METHOD_REGISTER_ON_ACTIVITY_DESTROY_LISTENER:Ljava/lang/reflect/Method;

    .line 60
    return-void

    .line 54
    :catch_26
    move-exception v0

    .line 56
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_23
.end method

.method public unregisterOnActivityDestroyListener(Landroid/preference/PreferenceManager;Landroid/preference/PreferenceManager$OnActivityDestroyListener;)V
    .registers 10
    .param p1, "pm"    # Landroid/preference/PreferenceManager;
    .param p2, "listener"    # Landroid/preference/PreferenceManager$OnActivityDestroyListener;

    .prologue
    .line 19
    iget-object v1, p0, Lcom/lb/material_preferences_library/custom_preferences/PreferenceManagerEx;->METHOD_UNREGISTER_ON_ACTIVITY_DESTROY_LISTENER:Ljava/lang/reflect/Method;

    .line 22
    .local v1, "unregisterMethod":Ljava/lang/reflect/Method;
    if-nez v1, :cond_1a

    .line 25
    :try_start_4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "unregisterOnActivityDestroyListener"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/preference/PreferenceManager$OnActivityDestroyListener;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 27
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 29
    :cond_1a
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    invoke-virtual {v1, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_23} :catch_26

    .line 36
    :goto_23
    iput-object v1, p0, Lcom/lb/material_preferences_library/custom_preferences/PreferenceManagerEx;->METHOD_UNREGISTER_ON_ACTIVITY_DESTROY_LISTENER:Ljava/lang/reflect/Method;

    .line 37
    return-void

    .line 31
    :catch_26
    move-exception v0

    .line 33
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_23
.end method
