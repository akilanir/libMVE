.class public final Lcom/googlecode/androidannotations/api/sharedpreferences/LongPrefField;
.super Lcom/googlecode/androidannotations/api/sharedpreferences/AbstractPrefField;
.source "LongPrefField.java"


# instance fields
.field private final defaultValue:J


# direct methods
.method constructor <init>(Landroid/content/SharedPreferences;Ljava/lang/String;J)V
    .registers 5
    .param p1, "sharedPreferences"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "defaultValue"    # J

    .prologue
    .line 25
    invoke-direct {p0, p1, p2}, Lcom/googlecode/androidannotations/api/sharedpreferences/AbstractPrefField;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 26
    iput-wide p3, p0, Lcom/googlecode/androidannotations/api/sharedpreferences/LongPrefField;->defaultValue:J

    .line 27
    return-void
.end method


# virtual methods
.method public get()J
    .registers 3

    .prologue
    .line 30
    iget-wide v0, p0, Lcom/googlecode/androidannotations/api/sharedpreferences/LongPrefField;->defaultValue:J

    invoke-virtual {p0, v0, v1}, Lcom/googlecode/androidannotations/api/sharedpreferences/LongPrefField;->getOr(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getOr(J)J
    .registers 5
    .param p1, "defaultValue"    # J

    .prologue
    .line 34
    iget-object v0, p0, Lcom/googlecode/androidannotations/api/sharedpreferences/LongPrefField;->sharedPreferences:Landroid/content/SharedPreferences;

    iget-object v1, p0, Lcom/googlecode/androidannotations/api/sharedpreferences/LongPrefField;->key:Ljava/lang/String;

    invoke-interface {v0, v1, p1, p2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public put(J)V
    .registers 5
    .param p1, "value"    # J

    .prologue
    .line 38
    invoke-virtual {p0}, Lcom/googlecode/androidannotations/api/sharedpreferences/LongPrefField;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lcom/googlecode/androidannotations/api/sharedpreferences/LongPrefField;->key:Ljava/lang/String;

    invoke-interface {v0, v1, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/googlecode/androidannotations/api/sharedpreferences/LongPrefField;->apply(Landroid/content/SharedPreferences$Editor;)V

    .line 39
    return-void
.end method
