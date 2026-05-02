.class public final Lorg/androidannotations/api/sharedpreferences/BooleanPrefField;
.super Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;
.source "BooleanPrefField.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/androidannotations/api/sharedpreferences/AbstractPrefField",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Boolean;)V
    .registers 4
    .param p1, "sharedPreferences"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "defaultValue"    # Ljava/lang/Boolean;

    .prologue
    .line 23
    invoke-direct {p0, p1, p2, p3}, Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Object;)V

    .line 24
    return-void
.end method


# virtual methods
.method public getOr(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .registers 5
    .param p1, "defaultValue"    # Ljava/lang/Boolean;

    .prologue
    .line 28
    iget-object v0, p0, Lorg/androidannotations/api/sharedpreferences/BooleanPrefField;->sharedPreferences:Landroid/content/SharedPreferences;

    iget-object v1, p0, Lorg/androidannotations/api/sharedpreferences/BooleanPrefField;->key:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getOr(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 20
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lorg/androidannotations/api/sharedpreferences/BooleanPrefField;->getOr(Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected putInternal(Ljava/lang/Boolean;)V
    .registers 5
    .param p1, "value"    # Ljava/lang/Boolean;

    .prologue
    .line 33
    invoke-virtual {p0}, Lorg/androidannotations/api/sharedpreferences/BooleanPrefField;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lorg/androidannotations/api/sharedpreferences/BooleanPrefField;->key:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/androidannotations/api/sharedpreferences/BooleanPrefField;->apply(Landroid/content/SharedPreferences$Editor;)V

    .line 34
    return-void
.end method

.method protected bridge synthetic putInternal(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 20
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lorg/androidannotations/api/sharedpreferences/BooleanPrefField;->putInternal(Ljava/lang/Boolean;)V

    return-void
.end method
