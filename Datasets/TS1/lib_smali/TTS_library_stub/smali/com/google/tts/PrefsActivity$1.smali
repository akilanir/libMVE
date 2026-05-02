.class Lcom/google/tts/PrefsActivity$1;
.super Ljava/lang/Object;
.source "PrefsActivity.java"

# interfaces
.implements Lcom/google/tts/TTS$InitListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/tts/PrefsActivity;
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
    iput-object p1, p0, Lcom/google/tts/PrefsActivity$1;->this$0:Lcom/google/tts/PrefsActivity;

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/google/tts/PrefsActivity$1;)Lcom/google/tts/PrefsActivity;
    .registers 2

    .prologue
    .line 40
    iget-object v0, p0, Lcom/google/tts/PrefsActivity$1;->this$0:Lcom/google/tts/PrefsActivity;

    return-object v0
.end method


# virtual methods
.method public onInit(I)V
    .registers 5
    .param p1, "version"    # I

    .prologue
    .line 42
    iget-object v1, p0, Lcom/google/tts/PrefsActivity$1;->this$0:Lcom/google/tts/PrefsActivity;

    const/high16 v2, 0x7f040000

    invoke-virtual {v1, v2}, Lcom/google/tts/PrefsActivity;->addPreferencesFromResource(I)V

    .line 43
    iget-object v1, p0, Lcom/google/tts/PrefsActivity$1;->this$0:Lcom/google/tts/PrefsActivity;

    # invokes: Lcom/google/tts/PrefsActivity;->loadEngines()V
    invoke-static {v1}, Lcom/google/tts/PrefsActivity;->access$0(Lcom/google/tts/PrefsActivity;)V

    .line 44
    iget-object v1, p0, Lcom/google/tts/PrefsActivity$1;->this$0:Lcom/google/tts/PrefsActivity;

    # invokes: Lcom/google/tts/PrefsActivity;->loadHellos()V
    invoke-static {v1}, Lcom/google/tts/PrefsActivity;->access$1(Lcom/google/tts/PrefsActivity;)V

    .line 45
    iget-object v1, p0, Lcom/google/tts/PrefsActivity$1;->this$0:Lcom/google/tts/PrefsActivity;

    const-string v2, "preview"

    invoke-virtual {v1, v2}, Lcom/google/tts/PrefsActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 46
    .local v0, "previewPref":Landroid/preference/Preference;
    new-instance v1, Lcom/google/tts/PrefsActivity$1$1;

    invoke-direct {v1, p0}, Lcom/google/tts/PrefsActivity$1$1;-><init>(Lcom/google/tts/PrefsActivity$1;)V

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 52
    return-void
.end method
