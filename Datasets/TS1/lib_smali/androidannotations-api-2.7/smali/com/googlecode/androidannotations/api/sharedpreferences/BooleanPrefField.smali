.class public final Lcom/googlecode/androidannotations/api/sharedpreferences/BooleanPrefField;
.super Lcom/googlecode/androidannotations/api/sharedpreferences/AbstractPrefField;
.source "BooleanPrefField.java"


# instance fields
.field private final defaultValue:Z


# direct methods
.method constructor <init>(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V
    .registers 4
    .param p1, "sharedPreferences"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "defaultValue"    # Z

    .prologue
    .line 25
    invoke-direct {p0, p1, p2}, Lcom/googlecode/androidannotations/api/sharedpreferences/AbstractPrefField;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 26
    iput-boolean p3, p0, Lcom/googlecode/androidannotations/api/sharedpreferences/BooleanPrefField;->defaultValue:Z

    .line 27
    return-void
.end method


# virtual methods
.method public get()Z
    .registers 2

    .prologue
    .line 30
    iget-boolean v0, p0, Lcom/googlecode/androidannotations/api/sharedpreferences/BooleanPrefField;->defaultValue:Z

    invoke-virtual {p0, v0}, Lcom/googlecode/androidannotations/api/sharedpreferences/BooleanPrefField;->getOr(Z)Z

    move-result v0

    return v0
.end method

.method public getOr(Z)Z
    .registers 4
    .param p1, "defaultValue"    # Z

    .prologue
    .line 34
    iget-object v0, p0, Lcom/googlecode/androidannotations/api/sharedpreferences/BooleanPrefField;->sharedPreferences:Landroid/content/SharedPreferences;

    iget-object v1, p0, Lcom/googlecode/androidannotations/api/sharedpreferences/BooleanPrefField;->key:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public put(Z)V
    .registers 4
    .param p1, "value"    # Z

    .prologue
    .line 38
    invoke-virtual {p0}, Lcom/googlecode/androidannotations/api/sharedpreferences/BooleanPrefField;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lcom/googlecode/androidannotations/api/sharedpreferences/BooleanPrefField;->key:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/googlecode/androidannotations/api/sharedpreferences/BooleanPrefField;->apply(Landroid/content/SharedPreferences$Editor;)V

    .line 39
    return-void
.end method
