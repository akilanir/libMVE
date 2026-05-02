.class public abstract Lorg/androidannotations/api/sharedpreferences/SharedPreferencesCompat;
.super Ljava/lang/Object;
.source "SharedPreferencesCompat.java"


# static fields
.field private static final APPLY_METHOD:Ljava/lang/reflect/Method;

.field private static final GET_STRING_SET_METHOD:Ljava/lang/reflect/Method;

.field private static final PUT_STRING_SET_METHOD:Ljava/lang/reflect/Method;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 33
    const-class v0, Landroid/content/SharedPreferences$Editor;

    const-string v1, "apply"

    new-array v2, v4, [Ljava/lang/Class;

    invoke-static {v0, v1, v2}, Lorg/androidannotations/api/sharedpreferences/SharedPreferencesCompat;->findMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lorg/androidannotations/api/sharedpreferences/SharedPreferencesCompat;->APPLY_METHOD:Ljava/lang/reflect/Method;

    .line 34
    const-class v0, Landroid/content/SharedPreferences;

    const-string v1, "getStringSet"

    new-array v2, v6, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    aput-object v3, v2, v4

    const-class v3, Ljava/util/Set;

    aput-object v3, v2, v5

    invoke-static {v0, v1, v2}, Lorg/androidannotations/api/sharedpreferences/SharedPreferencesCompat;->findMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lorg/androidannotations/api/sharedpreferences/SharedPreferencesCompat;->GET_STRING_SET_METHOD:Ljava/lang/reflect/Method;

    .line 35
    const-class v0, Landroid/content/SharedPreferences$Editor;

    const-string v1, "putStringSet"

    new-array v2, v6, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    aput-object v3, v2, v4

    const-class v3, Ljava/util/Set;

    aput-object v3, v2, v5

    invoke-static {v0, v1, v2}, Lorg/androidannotations/api/sharedpreferences/SharedPreferencesCompat;->findMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lorg/androidannotations/api/sharedpreferences/SharedPreferencesCompat;->PUT_STRING_SET_METHOD:Ljava/lang/reflect/Method;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method

.method public static apply(Landroid/content/SharedPreferences$Editor;)V
    .registers 4
    .param p0, "editor"    # Landroid/content/SharedPreferences$Editor;

    .prologue
    .line 39
    :try_start_0
    sget-object v1, Lorg/androidannotations/api/sharedpreferences/SharedPreferencesCompat;->APPLY_METHOD:Ljava/lang/reflect/Method;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, p0, v2}, Lorg/androidannotations/api/sharedpreferences/SharedPreferencesCompat;->invoke(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_8
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_8} :catch_9

    .line 44
    :goto_8
    return-void

    .line 41
    :catch_9
    move-exception v0

    .line 42
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_8
.end method

.method private static varargs findMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .prologue
    .line 68
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :try_start_0
    invoke-virtual {p0, p1, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v0

    .line 72
    :goto_4
    return-object v0

    .line 69
    :catch_5
    move-exception v0

    .line 72
    const/4 v0, 0x0

    goto :goto_4
.end method

.method public static getStringSet(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;
    .registers 8
    .param p0, "preferences"    # Landroid/content/SharedPreferences;
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/SharedPreferences;",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 48
    .local p2, "defValues":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :try_start_0
    sget-object v2, Lorg/androidannotations/api/sharedpreferences/SharedPreferencesCompat;->GET_STRING_SET_METHOD:Ljava/lang/reflect/Method;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    aput-object p2, v3, v4

    invoke-static {v2, p0, v3}, Lorg/androidannotations/api/sharedpreferences/SharedPreferencesCompat;->invoke(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Set;
    :try_end_11
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_11} :catch_12

    .line 54
    :goto_11
    return-object v2

    .line 49
    :catch_12
    move-exception v0

    .line 50
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    const/4 v2, 0x0

    invoke-interface {p0, p1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 51
    .local v1, "serializedSet":Ljava/lang/String;
    if-nez v1, :cond_1c

    move-object v2, p2

    .line 52
    goto :goto_11

    .line 54
    :cond_1c
    invoke-static {v1}, Lorg/androidannotations/api/sharedpreferences/SetXmlSerializer;->deserialize(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v2

    goto :goto_11
.end method

.method public static varargs invoke(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p0, "method"    # Ljava/lang/reflect/Method;
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 77
    if-nez p0, :cond_8

    .line 78
    new-instance v0, Ljava/lang/NoSuchMethodException;

    invoke-direct {v0}, Ljava/lang/NoSuchMethodException;-><init>()V

    throw v0

    .line 82
    :cond_8
    :try_start_8
    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_b
    .catch Ljava/lang/IllegalAccessException; {:try_start_8 .. :try_end_b} :catch_d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_8 .. :try_end_b} :catch_18
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_8 .. :try_end_b} :catch_1a

    move-result-object v0

    return-object v0

    .line 83
    :catch_d
    move-exception v0

    .line 91
    :goto_e
    new-instance v0, Ljava/lang/NoSuchMethodException;

    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 85
    :catch_18
    move-exception v0

    goto :goto_e

    .line 87
    :catch_1a
    move-exception v0

    goto :goto_e
.end method

.method public static putStringSet(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;Ljava/util/Set;)V
    .registers 7
    .param p0, "editor"    # Landroid/content/SharedPreferences$Editor;
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/SharedPreferences$Editor;",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 60
    .local p2, "values":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :try_start_0
    sget-object v1, Lorg/androidannotations/api/sharedpreferences/SharedPreferencesCompat;->PUT_STRING_SET_METHOD:Ljava/lang/reflect/Method;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object p2, v2, v3

    invoke-static {v1, p0, v2}, Lorg/androidannotations/api/sharedpreferences/SharedPreferencesCompat;->invoke(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_e
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_e} :catch_f

    .line 64
    :goto_e
    return-void

    .line 61
    :catch_f
    move-exception v0

    .line 62
    .local v0, "e1":Ljava/lang/NoSuchMethodException;
    invoke-static {p2}, Lorg/androidannotations/api/sharedpreferences/SetXmlSerializer;->serialize(Ljava/util/Set;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0, p1, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_e
.end method
