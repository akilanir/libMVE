.class public abstract Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;
.super Ljava/lang/Object;
.source "AbstractPrefField.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected final defaultValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field protected final key:Ljava/lang/String;

.field protected final sharedPreferences:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p1, "sharedPreferences"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/SharedPreferences;",
            "Ljava/lang/String;",
            "TT;)V"
        }
    .end annotation

    .prologue
    .line 28
    .local p0, "this":Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;, "Lorg/androidannotations/api/sharedpreferences/AbstractPrefField<TT;>;"
    .local p3, "defaultValue":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;->sharedPreferences:Landroid/content/SharedPreferences;

    .line 30
    iput-object p2, p0, Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;->key:Ljava/lang/String;

    .line 31
    iput-object p3, p0, Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;->defaultValue:Ljava/lang/Object;

    .line 32
    return-void
.end method


# virtual methods
.method protected final apply(Landroid/content/SharedPreferences$Editor;)V
    .registers 2
    .param p1, "editor"    # Landroid/content/SharedPreferences$Editor;

    .prologue
    .line 63
    .local p0, "this":Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;, "Lorg/androidannotations/api/sharedpreferences/AbstractPrefField<TT;>;"
    invoke-static {p1}, Lorg/androidannotations/api/sharedpreferences/SharedPreferencesCompat;->apply(Landroid/content/SharedPreferences$Editor;)V

    .line 64
    return-void
.end method

.method protected edit()Landroid/content/SharedPreferences$Editor;
    .registers 2

    .prologue
    .line 59
    .local p0, "this":Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;, "Lorg/androidannotations/api/sharedpreferences/AbstractPrefField<TT;>;"
    iget-object v0, p0, Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    return-object v0
.end method

.method public final exists()Z
    .registers 3

    .prologue
    .line 35
    .local p0, "this":Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;, "Lorg/androidannotations/api/sharedpreferences/AbstractPrefField<TT;>;"
    iget-object v0, p0, Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;->sharedPreferences:Landroid/content/SharedPreferences;

    iget-object v1, p0, Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;->key:Ljava/lang/String;

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public final get()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 43
    .local p0, "this":Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;, "Lorg/androidannotations/api/sharedpreferences/AbstractPrefField<TT;>;"
    iget-object v0, p0, Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;->defaultValue:Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;->getOr(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public abstract getOr(Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TT;"
        }
    .end annotation
.end method

.method public key()Ljava/lang/String;
    .registers 2

    .prologue
    .line 39
    .local p0, "this":Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;, "Lorg/androidannotations/api/sharedpreferences/AbstractPrefField<TT;>;"
    iget-object v0, p0, Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;->key:Ljava/lang/String;

    return-object v0
.end method

.method public final put(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 49
    .local p0, "this":Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;, "Lorg/androidannotations/api/sharedpreferences/AbstractPrefField<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    if-nez p1, :cond_4

    iget-object p1, p0, Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;->defaultValue:Ljava/lang/Object;

    .end local p1    # "value":Ljava/lang/Object;, "TT;"
    :cond_4
    invoke-virtual {p0, p1}, Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;->putInternal(Ljava/lang/Object;)V

    .line 50
    return-void
.end method

.method protected abstract putInternal(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method

.method public final remove()V
    .registers 3

    .prologue
    .line 55
    .local p0, "this":Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;, "Lorg/androidannotations/api/sharedpreferences/AbstractPrefField<TT;>;"
    invoke-virtual {p0}, Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;->key:Ljava/lang/String;

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;->apply(Landroid/content/SharedPreferences$Editor;)V

    .line 56
    return-void
.end method
