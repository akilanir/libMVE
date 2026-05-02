.class public final Lorg/androidannotations/api/sharedpreferences/FloatPrefField;
.super Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;
.source "FloatPrefField.java"


# instance fields
.field private final defaultValue:F


# direct methods
.method constructor <init>(Landroid/content/SharedPreferences;Ljava/lang/String;F)V
    .registers 4
    .param p1, "sharedPreferences"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "defaultValue"    # F

    .prologue
    .line 25
    invoke-direct {p0, p1, p2}, Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 26
    iput p3, p0, Lorg/androidannotations/api/sharedpreferences/FloatPrefField;->defaultValue:F

    .line 27
    return-void
.end method


# virtual methods
.method public get()F
    .registers 2

    .prologue
    .line 30
    iget v0, p0, Lorg/androidannotations/api/sharedpreferences/FloatPrefField;->defaultValue:F

    invoke-virtual {p0, v0}, Lorg/androidannotations/api/sharedpreferences/FloatPrefField;->getOr(F)F

    move-result v0

    return v0
.end method

.method public getOr(F)F
    .registers 9
    .param p1, "defaultValue"    # F

    .prologue
    .line 35
    :try_start_0
    iget-object v3, p0, Lorg/androidannotations/api/sharedpreferences/FloatPrefField;->sharedPreferences:Landroid/content/SharedPreferences;

    iget-object v4, p0, Lorg/androidannotations/api/sharedpreferences/FloatPrefField;->key:Ljava/lang/String;

    invoke-interface {v3, v4, p1}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F
    :try_end_7
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_7} :catch_9

    move-result v3

    .line 41
    :goto_8
    return v3

    .line 36
    :catch_9
    move-exception v0

    .line 40
    .local v0, "e":Ljava/lang/ClassCastException;
    :try_start_a
    iget-object v3, p0, Lorg/androidannotations/api/sharedpreferences/FloatPrefField;->sharedPreferences:Landroid/content/SharedPreferences;

    iget-object v4, p0, Lorg/androidannotations/api/sharedpreferences/FloatPrefField;->key:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 41
    .local v2, "value":Ljava/lang/String;
    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_28} :catch_2a

    move-result v3

    goto :goto_8

    .line 42
    .end local v2    # "value":Ljava/lang/String;
    :catch_2a
    move-exception v1

    .line 44
    .local v1, "e2":Ljava/lang/Exception;
    throw v0
.end method

.method public put(F)V
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 51
    invoke-virtual {p0}, Lorg/androidannotations/api/sharedpreferences/FloatPrefField;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lorg/androidannotations/api/sharedpreferences/FloatPrefField;->key:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/androidannotations/api/sharedpreferences/FloatPrefField;->apply(Landroid/content/SharedPreferences$Editor;)V

    .line 52
    return-void
.end method
