.class public final Lorg/androidannotations/api/sharedpreferences/StringPrefField;
.super Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;
.source "StringPrefField.java"


# instance fields
.field private final defaultValue:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "sharedPreferences"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 25
    invoke-direct {p0, p1, p2}, Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 26
    iput-object p3, p0, Lorg/androidannotations/api/sharedpreferences/StringPrefField;->defaultValue:Ljava/lang/String;

    .line 27
    return-void
.end method


# virtual methods
.method public get()Ljava/lang/String;
    .registers 2

    .prologue
    .line 30
    iget-object v0, p0, Lorg/androidannotations/api/sharedpreferences/StringPrefField;->defaultValue:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/androidannotations/api/sharedpreferences/StringPrefField;->getOr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOr(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 34
    iget-object v0, p0, Lorg/androidannotations/api/sharedpreferences/StringPrefField;->sharedPreferences:Landroid/content/SharedPreferences;

    iget-object v1, p0, Lorg/androidannotations/api/sharedpreferences/StringPrefField;->key:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/String;)V
    .registers 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 38
    invoke-virtual {p0}, Lorg/androidannotations/api/sharedpreferences/StringPrefField;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lorg/androidannotations/api/sharedpreferences/StringPrefField;->key:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/androidannotations/api/sharedpreferences/StringPrefField;->apply(Landroid/content/SharedPreferences$Editor;)V

    .line 39
    return-void
.end method
