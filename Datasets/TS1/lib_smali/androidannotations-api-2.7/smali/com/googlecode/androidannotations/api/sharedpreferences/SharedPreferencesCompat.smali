.class abstract Lcom/googlecode/androidannotations/api/sharedpreferences/SharedPreferencesCompat;
.super Ljava/lang/Object;
.source "SharedPreferencesCompat.java"


# static fields
.field private static final sApplyMethod:Ljava/lang/reflect/Method;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 33
    invoke-static {}, Lcom/googlecode/androidannotations/api/sharedpreferences/SharedPreferencesCompat;->findApplyMethod()Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/googlecode/androidannotations/api/sharedpreferences/SharedPreferencesCompat;->sApplyMethod:Ljava/lang/reflect/Method;

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
    .registers 3
    .param p0, "editor"    # Landroid/content/SharedPreferences$Editor;

    .prologue
    .line 46
    sget-object v0, Lcom/googlecode/androidannotations/api/sharedpreferences/SharedPreferencesCompat;->sApplyMethod:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_e

    .line 48
    :try_start_4
    sget-object v0, Lcom/googlecode/androidannotations/api/sharedpreferences/SharedPreferencesCompat;->sApplyMethod:Ljava/lang/reflect/Method;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_c
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_4 .. :try_end_c} :catch_12
    .catch Ljava/lang/IllegalAccessException; {:try_start_4 .. :try_end_c} :catch_d

    .line 57
    :goto_c
    return-void

    .line 52
    :catch_d
    move-exception v0

    .line 56
    :cond_e
    :goto_e
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_c

    .line 50
    :catch_12
    move-exception v0

    goto :goto_e
.end method

.method private static findApplyMethod()Ljava/lang/reflect/Method;
    .registers 3

    .prologue
    .line 37
    :try_start_0
    const-class v0, Landroid/content/SharedPreferences$Editor;

    .line 38
    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<Landroid/content/SharedPreferences$Editor;>;"
    const-string v1, "apply"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_a
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_a} :catch_c

    move-result-object v1

    .line 42
    :goto_b
    return-object v1

    .line 39
    :catch_c
    move-exception v1

    .line 42
    const/4 v1, 0x0

    goto :goto_b
.end method
