.class public abstract Lorg/androidannotations/api/sharedpreferences/EditorHelper;
.super Ljava/lang/Object;
.source "EditorHelper.java"


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
.field private final editor:Landroid/content/SharedPreferences$Editor;


# direct methods
.method public constructor <init>(Landroid/content/SharedPreferences;)V
    .registers 3
    .param p1, "sharedPreferences"    # Landroid/content/SharedPreferences;

    .prologue
    .line 25
    .local p0, "this":Lorg/androidannotations/api/sharedpreferences/EditorHelper;, "Lorg/androidannotations/api/sharedpreferences/EditorHelper<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iput-object v0, p0, Lorg/androidannotations/api/sharedpreferences/EditorHelper;->editor:Landroid/content/SharedPreferences$Editor;

    .line 27
    return-void
.end method

.method private cast()Lorg/androidannotations/api/sharedpreferences/EditorHelper;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 68
    .local p0, "this":Lorg/androidannotations/api/sharedpreferences/EditorHelper;, "Lorg/androidannotations/api/sharedpreferences/EditorHelper<TT;>;"
    return-object p0
.end method


# virtual methods
.method public final apply()V
    .registers 2

    .prologue
    .line 39
    .local p0, "this":Lorg/androidannotations/api/sharedpreferences/EditorHelper;, "Lorg/androidannotations/api/sharedpreferences/EditorHelper<TT;>;"
    iget-object v0, p0, Lorg/androidannotations/api/sharedpreferences/EditorHelper;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-static {v0}, Lorg/androidannotations/api/sharedpreferences/SharedPreferencesCompat;->apply(Landroid/content/SharedPreferences$Editor;)V

    .line 40
    return-void
.end method

.method protected booleanField(Ljava/lang/String;)Lorg/androidannotations/api/sharedpreferences/BooleanPrefEditorField;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lorg/androidannotations/api/sharedpreferences/BooleanPrefEditorField",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 55
    .local p0, "this":Lorg/androidannotations/api/sharedpreferences/EditorHelper;, "Lorg/androidannotations/api/sharedpreferences/EditorHelper<TT;>;"
    new-instance v0, Lorg/androidannotations/api/sharedpreferences/BooleanPrefEditorField;

    invoke-direct {p0}, Lorg/androidannotations/api/sharedpreferences/EditorHelper;->cast()Lorg/androidannotations/api/sharedpreferences/EditorHelper;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lorg/androidannotations/api/sharedpreferences/BooleanPrefEditorField;-><init>(Lorg/androidannotations/api/sharedpreferences/EditorHelper;Ljava/lang/String;)V

    return-object v0
.end method

.method public final clear()Lorg/androidannotations/api/sharedpreferences/EditorHelper;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 34
    .local p0, "this":Lorg/androidannotations/api/sharedpreferences/EditorHelper;, "Lorg/androidannotations/api/sharedpreferences/EditorHelper<TT;>;"
    iget-object v0, p0, Lorg/androidannotations/api/sharedpreferences/EditorHelper;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 35
    invoke-direct {p0}, Lorg/androidannotations/api/sharedpreferences/EditorHelper;->cast()Lorg/androidannotations/api/sharedpreferences/EditorHelper;

    move-result-object v0

    return-object v0
.end method

.method protected floatField(Ljava/lang/String;)Lorg/androidannotations/api/sharedpreferences/FloatPrefEditorField;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lorg/androidannotations/api/sharedpreferences/FloatPrefEditorField",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 59
    .local p0, "this":Lorg/androidannotations/api/sharedpreferences/EditorHelper;, "Lorg/androidannotations/api/sharedpreferences/EditorHelper<TT;>;"
    new-instance v0, Lorg/androidannotations/api/sharedpreferences/FloatPrefEditorField;

    invoke-direct {p0}, Lorg/androidannotations/api/sharedpreferences/EditorHelper;->cast()Lorg/androidannotations/api/sharedpreferences/EditorHelper;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lorg/androidannotations/api/sharedpreferences/FloatPrefEditorField;-><init>(Lorg/androidannotations/api/sharedpreferences/EditorHelper;Ljava/lang/String;)V

    return-object v0
.end method

.method protected getEditor()Landroid/content/SharedPreferences$Editor;
    .registers 2

    .prologue
    .line 30
    .local p0, "this":Lorg/androidannotations/api/sharedpreferences/EditorHelper;, "Lorg/androidannotations/api/sharedpreferences/EditorHelper<TT;>;"
    iget-object v0, p0, Lorg/androidannotations/api/sharedpreferences/EditorHelper;->editor:Landroid/content/SharedPreferences$Editor;

    return-object v0
.end method

.method protected intField(Ljava/lang/String;)Lorg/androidannotations/api/sharedpreferences/IntPrefEditorField;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lorg/androidannotations/api/sharedpreferences/IntPrefEditorField",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 43
    .local p0, "this":Lorg/androidannotations/api/sharedpreferences/EditorHelper;, "Lorg/androidannotations/api/sharedpreferences/EditorHelper<TT;>;"
    new-instance v0, Lorg/androidannotations/api/sharedpreferences/IntPrefEditorField;

    invoke-direct {p0}, Lorg/androidannotations/api/sharedpreferences/EditorHelper;->cast()Lorg/androidannotations/api/sharedpreferences/EditorHelper;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lorg/androidannotations/api/sharedpreferences/IntPrefEditorField;-><init>(Lorg/androidannotations/api/sharedpreferences/EditorHelper;Ljava/lang/String;)V

    return-object v0
.end method

.method protected longField(Ljava/lang/String;)Lorg/androidannotations/api/sharedpreferences/LongPrefEditorField;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lorg/androidannotations/api/sharedpreferences/LongPrefEditorField",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 63
    .local p0, "this":Lorg/androidannotations/api/sharedpreferences/EditorHelper;, "Lorg/androidannotations/api/sharedpreferences/EditorHelper<TT;>;"
    new-instance v0, Lorg/androidannotations/api/sharedpreferences/LongPrefEditorField;

    invoke-direct {p0}, Lorg/androidannotations/api/sharedpreferences/EditorHelper;->cast()Lorg/androidannotations/api/sharedpreferences/EditorHelper;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lorg/androidannotations/api/sharedpreferences/LongPrefEditorField;-><init>(Lorg/androidannotations/api/sharedpreferences/EditorHelper;Ljava/lang/String;)V

    return-object v0
.end method

.method protected stringField(Ljava/lang/String;)Lorg/androidannotations/api/sharedpreferences/StringPrefEditorField;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lorg/androidannotations/api/sharedpreferences/StringPrefEditorField",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 47
    .local p0, "this":Lorg/androidannotations/api/sharedpreferences/EditorHelper;, "Lorg/androidannotations/api/sharedpreferences/EditorHelper<TT;>;"
    new-instance v0, Lorg/androidannotations/api/sharedpreferences/StringPrefEditorField;

    invoke-direct {p0}, Lorg/androidannotations/api/sharedpreferences/EditorHelper;->cast()Lorg/androidannotations/api/sharedpreferences/EditorHelper;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lorg/androidannotations/api/sharedpreferences/StringPrefEditorField;-><init>(Lorg/androidannotations/api/sharedpreferences/EditorHelper;Ljava/lang/String;)V

    return-object v0
.end method

.method protected stringSetField(Ljava/lang/String;)Lorg/androidannotations/api/sharedpreferences/StringSetPrefEditorField;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lorg/androidannotations/api/sharedpreferences/StringSetPrefEditorField",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "this":Lorg/androidannotations/api/sharedpreferences/EditorHelper;, "Lorg/androidannotations/api/sharedpreferences/EditorHelper<TT;>;"
    new-instance v0, Lorg/androidannotations/api/sharedpreferences/StringSetPrefEditorField;

    invoke-direct {p0}, Lorg/androidannotations/api/sharedpreferences/EditorHelper;->cast()Lorg/androidannotations/api/sharedpreferences/EditorHelper;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lorg/androidannotations/api/sharedpreferences/StringSetPrefEditorField;-><init>(Lorg/androidannotations/api/sharedpreferences/EditorHelper;Ljava/lang/String;)V

    return-object v0
.end method
