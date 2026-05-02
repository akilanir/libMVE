.class public final Lorg/androidannotations/api/sharedpreferences/StringSetPrefField;
.super Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;
.source "StringSetPrefField.java"


# instance fields
.field private final defaultValue:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/util/Set;)V
    .registers 4
    .param p1, "sharedPreferences"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/SharedPreferences;",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p3, "defaultValue":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-direct {p0, p1, p2}, Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 28
    iput-object p3, p0, Lorg/androidannotations/api/sharedpreferences/StringSetPrefField;->defaultValue:Ljava/util/Set;

    .line 29
    return-void
.end method


# virtual methods
.method public get()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 32
    iget-object v0, p0, Lorg/androidannotations/api/sharedpreferences/StringSetPrefField;->defaultValue:Ljava/util/Set;

    invoke-virtual {p0, v0}, Lorg/androidannotations/api/sharedpreferences/StringSetPrefField;->getOr(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getOr(Ljava/util/Set;)Ljava/util/Set;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
    .line 36
    .local p1, "defaultValue":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v0, p0, Lorg/androidannotations/api/sharedpreferences/StringSetPrefField;->sharedPreferences:Landroid/content/SharedPreferences;

    iget-object v1, p0, Lorg/androidannotations/api/sharedpreferences/StringSetPrefField;->key:Ljava/lang/String;

    invoke-static {v0, v1, p1}, Lorg/androidannotations/api/sharedpreferences/SharedPreferencesCompat;->getStringSet(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/util/Set;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 40
    .local p1, "value":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v1, p0, Lorg/androidannotations/api/sharedpreferences/StringSetPrefField;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 41
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    iget-object v1, p0, Lorg/androidannotations/api/sharedpreferences/StringSetPrefField;->key:Ljava/lang/String;

    invoke-static {v0, v1, p1}, Lorg/androidannotations/api/sharedpreferences/SharedPreferencesCompat;->putStringSet(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;Ljava/util/Set;)V

    .line 42
    invoke-virtual {p0, v0}, Lorg/androidannotations/api/sharedpreferences/StringSetPrefField;->apply(Landroid/content/SharedPreferences$Editor;)V

    .line 43
    return-void
.end method
