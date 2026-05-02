.class Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$1;
.super Ljava/lang/Object;
.source "FileChooserDialog.java"

# interfaces
.implements Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;


# direct methods
.method constructor <init>(Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;)V
    .registers 2

    .prologue
    .line 142
    iput-object p1, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$1;->this$0:Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Lcom/afollestad/materialdialogs/MaterialDialog;Lcom/afollestad/materialdialogs/DialogAction;)V
    .registers 3
    .param p1, "dialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "which"    # Lcom/afollestad/materialdialogs/DialogAction;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 145
    invoke-virtual {p1}, Lcom/afollestad/materialdialogs/MaterialDialog;->dismiss()V

    .line 146
    return-void
.end method
