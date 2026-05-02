.class public final Lorg/androidannotations/api/sharedpreferences/StringSetPrefEditorField;
.super Lorg/androidannotations/api/sharedpreferences/AbstractPrefEditorField;
.source "StringSetPrefEditorField.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lorg/androidannotations/api/sharedpreferences/EditorHelper",
        "<TT;>;>",
        "Lorg/androidannotations/api/sharedpreferences/AbstractPrefEditorField",
        "<TT;>;"
    }
.end annotation


# direct methods
.method constructor <init>(Lorg/androidannotations/api/sharedpreferences/EditorHelper;Ljava/lang/String;)V
    .registers 3
    .param p2, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 23
    .local p0, "this":Lorg/androidannotations/api/sharedpreferences/StringSetPrefEditorField;, "Lorg/androidannotations/api/sharedpreferences/StringSetPrefEditorField<TT;>;"
    .local p1, "editorHelper":Lorg/androidannotations/api/sharedpreferences/EditorHelper;, "TT;"
    invoke-direct {p0, p1, p2}, Lorg/androidannotations/api/sharedpreferences/AbstractPrefEditorField;-><init>(Lorg/androidannotations/api/sharedpreferences/EditorHelper;Ljava/lang/String;)V

    .line 24
    return-void
.end method


# virtual methods
.method public put(Ljava/util/Set;)Lorg/androidannotations/api/sharedpreferences/EditorHelper;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)TT;"
        }
    .end annotation

    .prologue
    .line 27
    .local p0, "this":Lorg/androidannotations/api/sharedpreferences/StringSetPrefEditorField;, "Lorg/androidannotations/api/sharedpreferences/StringSetPrefEditorField<TT;>;"
    .local p1, "value":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v0, p0, Lorg/androidannotations/api/sharedpreferences/StringSetPrefEditorField;->editorHelper:Lorg/androidannotations/api/sharedpreferences/EditorHelper;

    invoke-virtual {v0}, Lorg/androidannotations/api/sharedpreferences/EditorHelper;->getEditor()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lorg/androidannotations/api/sharedpreferences/StringSetPrefEditorField;->key:Ljava/lang/String;

    invoke-static {v0, v1, p1}, Lorg/androidannotations/api/sharedpreferences/SharedPreferencesCompat;->putStringSet(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;Ljava/util/Set;)V

    .line 28
    iget-object v0, p0, Lorg/androidannotations/api/sharedpreferences/StringSetPrefEditorField;->editorHelper:Lorg/androidannotations/api/sharedpreferences/EditorHelper;

    return-object v0
.end method
