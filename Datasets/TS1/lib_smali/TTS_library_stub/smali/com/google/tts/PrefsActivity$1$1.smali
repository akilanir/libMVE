.class Lcom/google/tts/PrefsActivity$1$1;
.super Ljava/lang/Object;
.source "PrefsActivity.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/tts/PrefsActivity$1;->onInit(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/tts/PrefsActivity$1;


# direct methods
.method constructor <init>(Lcom/google/tts/PrefsActivity$1;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/google/tts/PrefsActivity$1$1;->this$1:Lcom/google/tts/PrefsActivity$1;

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .registers 3
    .param p1, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/google/tts/PrefsActivity$1$1;->this$1:Lcom/google/tts/PrefsActivity$1;

    # getter for: Lcom/google/tts/PrefsActivity$1;->this$0:Lcom/google/tts/PrefsActivity;
    invoke-static {v0}, Lcom/google/tts/PrefsActivity$1;->access$0(Lcom/google/tts/PrefsActivity$1;)Lcom/google/tts/PrefsActivity;

    move-result-object v0

    # invokes: Lcom/google/tts/PrefsActivity;->sayHello()V
    invoke-static {v0}, Lcom/google/tts/PrefsActivity;->access$2(Lcom/google/tts/PrefsActivity;)V

    .line 49
    const/4 v0, 0x1

    return v0
.end method
