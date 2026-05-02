.class public final Lcom/googlecode/androidannotations/api/sharedpreferences/FloatPrefField;
.super Lcom/googlecode/androidannotations/api/sharedpreferences/AbstractPrefField;
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
    invoke-direct {p0, p1, p2}, Lcom/googlecode/androidannotations/api/sharedpreferences/AbstractPrefField;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 26
    iput p3, p0, Lcom/googlecode/androidannotations/api/sharedpreferences/FloatPrefField;->defaultValue:F

    .line 27
    return-void
.end method


# virtual methods
.method public get()F
    .registers 2

    .prologue
    .line 30
    iget v0, p0, Lcom/googlecode/androidannotations/api/sharedpreferences/FloatPrefField;->defaultValue:F

    invoke-virtual {p0, v0}, Lcom/googlecode/androidannotations/api/sharedpreferences/FloatPrefField;->getOr(F)F

    move-result v0

    return v0
.end method

.method public getOr(F)F
    .registers 4
    .param p1, "defaultValue"    # F

    .prologue
    .line 34
    iget-object v0, p0, Lcom/googlecode/androidannotations/api/sharedpreferences/FloatPrefField;->sharedPreferences:Landroid/content/SharedPreferences;

    iget-object v1, p0, Lcom/googlecode/androidannotations/api/sharedpreferences/FloatPrefField;->key:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v0

    return v0
.end method

.method public put(F)V
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 38
    invoke-virtual {p0}, Lcom/googlecode/androidannotations/api/sharedpreferences/FloatPrefField;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lcom/googlecode/androidannotations/api/sharedpreferences/FloatPrefField;->key:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/googlecode/androidannotations/api/sharedpreferences/FloatPrefField;->apply(Landroid/content/SharedPreferences$Editor;)V

    .line 39
    return-void
.end method
