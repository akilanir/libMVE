.class Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$1;
.super Ljava/lang/Object;
.source "MaterialListPreference.java"

# interfaces
.implements Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackSingleChoice;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->showDialog(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;


# direct methods
.method constructor <init>(Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;)V
    .registers 2

    .prologue
    .line 89
    iput-object p1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$1;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSelection(Lcom/afollestad/materialdialogs/MaterialDialog;Landroid/view/View;ILjava/lang/CharSequence;)Z
    .registers 11
    .param p1, "dialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;
    .param p2, "itemView"    # Landroid/view/View;
    .param p3, "which"    # I
    .param p4, "text"    # Ljava/lang/CharSequence;

    .prologue
    const/4 v5, 0x1

    .line 92
    iget-object v2, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$1;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;

    const/4 v3, 0x0

    const/4 v4, -0x1

    invoke-virtual {v2, v3, v4}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->onClick(Landroid/content/DialogInterface;I)V

    .line 93
    if-ltz p3, :cond_27

    iget-object v2, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$1;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;

    invoke-virtual {v2}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v2

    if-eqz v2, :cond_27

    .line 95
    :try_start_12
    const-class v2, Landroid/preference/ListPreference;

    const-string v3, "mClickedDialogEntryIndex"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 96
    .local v0, "clickedIndex":Ljava/lang/reflect/Field;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 97
    iget-object v2, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$1;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_27} :catch_28

    .line 102
    .end local v0    # "clickedIndex":Ljava/lang/reflect/Field;
    :cond_27
    :goto_27
    return v5

    .line 98
    :catch_28
    move-exception v1

    .line 99
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_27
.end method
