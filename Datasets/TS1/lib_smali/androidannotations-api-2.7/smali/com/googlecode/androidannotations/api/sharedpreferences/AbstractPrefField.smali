.class public abstract Lcom/googlecode/androidannotations/api/sharedpreferences/AbstractPrefField;
.super Ljava/lang/Object;
.source "AbstractPrefField.java"


# instance fields
.field protected final key:Ljava/lang/String;

.field protected final sharedPreferences:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 3
    .param p1, "sharedPreferences"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/googlecode/androidannotations/api/sharedpreferences/AbstractPrefField;->sharedPreferences:Landroid/content/SharedPreferences;

    .line 28
    iput-object p2, p0, Lcom/googlecode/androidannotations/api/sharedpreferences/AbstractPrefField;->key:Ljava/lang/String;

    .line 29
    return-void
.end method


# virtual methods
.method protected final apply(Landroid/content/SharedPreferences$Editor;)V
    .registers 2
    .param p1, "editor"    # Landroid/content/SharedPreferences$Editor;

    .prologue
    .line 44
    invoke-static {p1}, Lcom/googlecode/androidannotations/api/sharedpreferences/SharedPreferencesCompat;->apply(Landroid/content/SharedPreferences$Editor;)V

    .line 45
    return-void
.end method

.method protected edit()Landroid/content/SharedPreferences$Editor;
    .registers 2

    .prologue
    .line 40
    iget-object v0, p0, Lcom/googlecode/androidannotations/api/sharedpreferences/AbstractPrefField;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    return-object v0
.end method

.method public final exists()Z
    .registers 3

    .prologue
    .line 32
    iget-object v0, p0, Lcom/googlecode/androidannotations/api/sharedpreferences/AbstractPrefField;->sharedPreferences:Landroid/content/SharedPreferences;

    iget-object v1, p0, Lcom/googlecode/androidannotations/api/sharedpreferences/AbstractPrefField;->key:Ljava/lang/String;

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public final remove()V
    .registers 3

    .prologue
    .line 36
    invoke-virtual {p0}, Lcom/googlecode/androidannotations/api/sharedpreferences/AbstractPrefField;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lcom/googlecode/androidannotations/api/sharedpreferences/AbstractPrefField;->key:Ljava/lang/String;

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/googlecode/androidannotations/api/sharedpreferences/AbstractPrefField;->apply(Landroid/content/SharedPreferences$Editor;)V

    .line 37
    return-void
.end method
