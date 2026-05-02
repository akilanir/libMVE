.class Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$1;
.super Ljava/lang/Object;
.source "MaterialMultiSelectListPreference.java"

# interfaces
.implements Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackMultiChoice;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->showDialog(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;


# direct methods
.method constructor <init>(Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;)V
    .registers 2

    .prologue
    .line 106
    iput-object p1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$1;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSelection(Lcom/afollestad/materialdialogs/MaterialDialog;[Ljava/lang/Integer;[Ljava/lang/CharSequence;)Z
    .registers 12
    .param p1, "dialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;
    .param p2, "which"    # [Ljava/lang/Integer;
    .param p3, "text"    # [Ljava/lang/CharSequence;

    .prologue
    .line 109
    iget-object v5, p0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$1;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;

    const/4 v6, 0x0

    const/4 v7, -0x1

    invoke-virtual {v5, v6, v7}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->onClick(Landroid/content/DialogInterface;I)V

    .line 110
    invoke-virtual {p1}, Lcom/afollestad/materialdialogs/MaterialDialog;->dismiss()V

    .line 111
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 112
    .local v4, "values":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    move-object v0, p2

    .local v0, "arr$":[Ljava/lang/Integer;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_12
    if-ge v2, v3, :cond_2c

    aget-object v5, v0, v2

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 113
    .local v1, "i":I
    iget-object v5, p0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$1;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;

    invoke-virtual {v5}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v5

    aget-object v5, v5, v1

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 112
    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    .line 115
    .end local v1    # "i":I
    :cond_2c
    iget-object v5, p0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$1;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;

    # invokes: Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->callChangeListener(Ljava/lang/Object;)Z
    invoke-static {v5, v4}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->access$000(Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_39

    .line 116
    iget-object v5, p0, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$1;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;

    invoke-virtual {v5, v4}, Lcom/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference;->setValues(Ljava/util/Set;)V

    .line 117
    :cond_39
    const/4 v5, 0x1

    return v5
.end method
