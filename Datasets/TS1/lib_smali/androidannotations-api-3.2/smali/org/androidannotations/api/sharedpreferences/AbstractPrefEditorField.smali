.class public abstract Lorg/androidannotations/api/sharedpreferences/AbstractPrefEditorField;
.super Ljava/lang/Object;
.source "AbstractPrefEditorField.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lorg/androidannotations/api/sharedpreferences/EditorHelper",
        "<TT;>;>",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected final editorHelper:Lorg/androidannotations/api/sharedpreferences/EditorHelper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field protected final key:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/androidannotations/api/sharedpreferences/EditorHelper;Ljava/lang/String;)V
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
    .line 24
    .local p0, "this":Lorg/androidannotations/api/sharedpreferences/AbstractPrefEditorField;, "Lorg/androidannotations/api/sharedpreferences/AbstractPrefEditorField<TT;>;"
    .local p1, "editorHelper":Lorg/androidannotations/api/sharedpreferences/EditorHelper;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lorg/androidannotations/api/sharedpreferences/AbstractPrefEditorField;->editorHelper:Lorg/androidannotations/api/sharedpreferences/EditorHelper;

    .line 26
    iput-object p2, p0, Lorg/androidannotations/api/sharedpreferences/AbstractPrefEditorField;->key:Ljava/lang/String;

    .line 27
    return-void
.end method


# virtual methods
.method public final remove()Lorg/androidannotations/api/sharedpreferences/EditorHelper;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 30
    .local p0, "this":Lorg/androidannotations/api/sharedpreferences/AbstractPrefEditorField;, "Lorg/androidannotations/api/sharedpreferences/AbstractPrefEditorField<TT;>;"
    iget-object v0, p0, Lorg/androidannotations/api/sharedpreferences/AbstractPrefEditorField;->editorHelper:Lorg/androidannotations/api/sharedpreferences/EditorHelper;

    invoke-virtual {v0}, Lorg/androidannotations/api/sharedpreferences/EditorHelper;->getEditor()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lorg/androidannotations/api/sharedpreferences/AbstractPrefEditorField;->key:Ljava/lang/String;

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 31
    iget-object v0, p0, Lorg/androidannotations/api/sharedpreferences/AbstractPrefEditorField;->editorHelper:Lorg/androidannotations/api/sharedpreferences/EditorHelper;

    return-object v0
.end method
