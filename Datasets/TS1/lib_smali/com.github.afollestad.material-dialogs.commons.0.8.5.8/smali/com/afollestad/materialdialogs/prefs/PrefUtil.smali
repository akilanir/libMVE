.class Lcom/afollestad/materialdialogs/prefs/PrefUtil;
.super Ljava/lang/Object;
.source "PrefUtil.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    return-void
.end method

.method public static registerOnActivityDestroyListener(Landroid/preference/Preference;Landroid/preference/PreferenceManager$OnActivityDestroyListener;)V
    .registers 9
    .param p0, "preference"    # Landroid/preference/Preference;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "listener"    # Landroid/preference/PreferenceManager$OnActivityDestroyListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 53
    :try_start_0
    invoke-virtual {p0}, Landroid/preference/Preference;->getPreferenceManager()Landroid/preference/PreferenceManager;

    move-result-object v1

    .line 54
    .local v1, "pm":Landroid/preference/PreferenceManager;
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "registerOnActivityDestroyListener"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/preference/PreferenceManager$OnActivityDestroyListener;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 57
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 58
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_23} :catch_24

    .line 61
    .end local v0    # "method":Ljava/lang/reflect/Method;
    .end local v1    # "pm":Landroid/preference/PreferenceManager;
    :goto_23
    return-void

    .line 59
    :catch_24
    move-exception v2

    goto :goto_23
.end method

.method public static setLayoutResource(Landroid/content/Context;Landroid/preference/Preference;Landroid/util/AttributeSet;)V
    .registers 11
    .param p0, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "preference"    # Landroid/preference/Preference;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v7, 0x0

    .line 25
    const/4 v1, 0x0

    .line 26
    .local v1, "foundLayout":Z
    if-eqz p2, :cond_27

    .line 27
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5
    invoke-interface {p2}, Landroid/util/AttributeSet;->getAttributeCount()I

    move-result v5

    if-ge v2, v5, :cond_27

    move-object v5, p2

    .line 28
    check-cast v5, Landroid/content/res/XmlResourceParser;

    invoke-interface {v5, v7}, Landroid/content/res/XmlResourceParser;->getAttributeNamespace(I)Ljava/lang/String;

    move-result-object v3

    .line 29
    .local v3, "namespace":Ljava/lang/String;
    const-string v5, "http://schemas.android.com/apk/res/android"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_48

    invoke-interface {p2, v2}, Landroid/util/AttributeSet;->getAttributeName(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, "layout"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_48

    .line 31
    const/4 v1, 0x1

    .line 37
    .end local v2    # "i":I
    .end local v3    # "namespace":Ljava/lang/String;
    :cond_27
    const/4 v4, 0x0

    .line 38
    .local v4, "useStockLayout":Z
    if-eqz p2, :cond_3e

    .line 39
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v5

    sget-object v6, Lcom/afollestad/materialdialogs/commons/R$styleable;->Preference:[I

    invoke-virtual {v5, p2, v6, v7, v7}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 41
    .local v0, "a":Landroid/content/res/TypedArray;
    :try_start_34
    sget v5, Lcom/afollestad/materialdialogs/commons/R$styleable;->Preference_useStockLayout:I

    const/4 v6, 0x0

    invoke-virtual {v0, v5, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z
    :try_end_3a
    .catchall {:try_start_34 .. :try_end_3a} :catchall_4b

    move-result v4

    .line 43
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 47
    .end local v0    # "a":Landroid/content/res/TypedArray;
    :cond_3e
    if-nez v1, :cond_47

    if-nez v4, :cond_47

    .line 48
    sget v5, Lcom/afollestad/materialdialogs/commons/R$layout;->md_preference_custom:I

    invoke-virtual {p1, v5}, Landroid/preference/Preference;->setLayoutResource(I)V

    .line 49
    :cond_47
    return-void

    .line 27
    .end local v4    # "useStockLayout":Z
    .restart local v2    # "i":I
    .restart local v3    # "namespace":Ljava/lang/String;
    :cond_48
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 43
    .end local v2    # "i":I
    .end local v3    # "namespace":Ljava/lang/String;
    .restart local v0    # "a":Landroid/content/res/TypedArray;
    .restart local v4    # "useStockLayout":Z
    :catchall_4b
    move-exception v5

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    throw v5
.end method

.method public static unregisterOnActivityDestroyListener(Landroid/preference/Preference;Landroid/preference/PreferenceManager$OnActivityDestroyListener;)V
    .registers 9
    .param p0, "preference"    # Landroid/preference/Preference;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "listener"    # Landroid/preference/PreferenceManager$OnActivityDestroyListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 65
    :try_start_0
    invoke-virtual {p0}, Landroid/preference/Preference;->getPreferenceManager()Landroid/preference/PreferenceManager;

    move-result-object v1

    .line 66
    .local v1, "pm":Landroid/preference/PreferenceManager;
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "unregisterOnActivityDestroyListener"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/preference/PreferenceManager$OnActivityDestroyListener;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 69
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 70
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_23} :catch_24

    .line 73
    .end local v0    # "method":Ljava/lang/reflect/Method;
    .end local v1    # "pm":Landroid/preference/PreferenceManager;
    :goto_23
    return-void

    .line 71
    :catch_24
    move-exception v2

    goto :goto_23
.end method
