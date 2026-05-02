.class Lcom/google/tts/PrefsActivity$2;
.super Ljava/lang/Object;
.source "PrefsActivity.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/tts/PrefsActivity;->loadEngines()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/tts/PrefsActivity;


# direct methods
.method constructor <init>(Lcom/google/tts/PrefsActivity;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/google/tts/PrefsActivity$2;->this$0:Lcom/google/tts/PrefsActivity;

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .registers 7
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 84
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 85
    .local v0, "chosenEngine":Ljava/lang/String;
    const-string v2, "/data/data/com.svox.pico/lib/libttspico.so"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_24

    .line 86
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 87
    .local v1, "intent":Landroid/content/Intent;
    const-string v2, "android.speech.tts.engine.CHECK_TTS_DATA"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 88
    const-string v2, "com.svox.pico"

    const-string v3, "com.svox.pico.CheckVoiceData"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 89
    iget-object v2, p0, Lcom/google/tts/PrefsActivity$2;->this$0:Lcom/google/tts/PrefsActivity;

    const/16 v3, 0x2a

    invoke-virtual {v2, v1, v3}, Lcom/google/tts/PrefsActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 91
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_24
    const/4 v2, 0x1

    return v2
.end method
