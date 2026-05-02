.class Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$1;
.super Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;
.source "MaterialEditTextPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;


# direct methods
.method constructor <init>(Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;)V
    .registers 2

    .prologue
    .line 162
    iput-object p1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$1;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;

    invoke-direct {p0}, Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onNegative(Lcom/afollestad/materialdialogs/MaterialDialog;)V
    .registers 4
    .param p1, "dialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;

    .prologue
    .line 178
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$1;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;

    const/4 v1, -0x2

    invoke-virtual {v0, p1, v1}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->onClick(Landroid/content/DialogInterface;I)V

    .line 179
    return-void
.end method

.method public onNeutral(Lcom/afollestad/materialdialogs/MaterialDialog;)V
    .registers 4
    .param p1, "dialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;

    .prologue
    .line 173
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$1;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;

    const/4 v1, -0x3

    invoke-virtual {v0, p1, v1}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->onClick(Landroid/content/DialogInterface;I)V

    .line 174
    return-void
.end method

.method public onPositive(Lcom/afollestad/materialdialogs/MaterialDialog;)V
    .registers 5
    .param p1, "dialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;

    .prologue
    .line 165
    iget-object v1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$1;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;

    const/4 v2, -0x1

    invoke-virtual {v1, p1, v2}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->onClick(Landroid/content/DialogInterface;I)V

    .line 166
    iget-object v1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$1;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;

    # getter for: Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->mEditText:Landroid/widget/EditText;
    invoke-static {v1}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->access$000(Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 167
    .local v0, "value":Ljava/lang/String;
    iget-object v1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$1;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;

    # invokes: Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->callChangeListener(Ljava/lang/Object;)Z
    invoke-static {v1, v0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->access$100(Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_29

    iget-object v1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$1;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;

    invoke-virtual {v1}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->isPersistent()Z

    move-result v1

    if-eqz v1, :cond_29

    .line 168
    iget-object v1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference$1;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;

    invoke-virtual {v1, v0}, Lcom/afollestad/materialdialogs/prefs/MaterialEditTextPreference;->setText(Ljava/lang/String;)V

    .line 169
    :cond_29
    return-void
.end method
