.class Lcom/lb/material_preferences_library/custom_preferences/ListPreference$1;
.super Ljava/lang/Object;
.source "ListPreference.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->onPrepareDialogBuilder(Landroid/support/v7/app/AlertDialog$Builder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lb/material_preferences_library/custom_preferences/ListPreference;


# direct methods
.method constructor <init>(Lcom/lb/material_preferences_library/custom_preferences/ListPreference;)V
    .registers 2

    .prologue
    .line 309
    iput-object p1, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference$1;->this$0:Lcom/lb/material_preferences_library/custom_preferences/ListPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 5
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 312
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference$1;->this$0:Lcom/lb/material_preferences_library/custom_preferences/ListPreference;

    # setter for: Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->mClickedDialogEntryIndex:I
    invoke-static {v0, p2}, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->access$002(Lcom/lb/material_preferences_library/custom_preferences/ListPreference;I)I

    .line 318
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference$1;->this$0:Lcom/lb/material_preferences_library/custom_preferences/ListPreference;

    const/4 v1, -0x1

    invoke-virtual {v0, p1, v1}, Lcom/lb/material_preferences_library/custom_preferences/ListPreference;->onClick(Landroid/content/DialogInterface;I)V

    .line 319
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 320
    return-void
.end method
