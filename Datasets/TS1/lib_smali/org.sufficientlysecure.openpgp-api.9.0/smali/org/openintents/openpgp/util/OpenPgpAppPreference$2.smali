.class Lorg/openintents/openpgp/util/OpenPgpAppPreference$2;
.super Ljava/lang/Object;
.source "OpenPgpAppPreference.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/openintents/openpgp/util/OpenPgpAppPreference;->onPrepareDialogBuilder(Landroid/app/AlertDialog$Builder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/openintents/openpgp/util/OpenPgpAppPreference;


# direct methods
.method constructor <init>(Lorg/openintents/openpgp/util/OpenPgpAppPreference;)V
    .registers 2

    .prologue
    .line 111
    iput-object p1, p0, Lorg/openintents/openpgp/util/OpenPgpAppPreference$2;->this$0:Lorg/openintents/openpgp/util/OpenPgpAppPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 6
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 115
    iget-object v1, p0, Lorg/openintents/openpgp/util/OpenPgpAppPreference$2;->this$0:Lorg/openintents/openpgp/util/OpenPgpAppPreference;

    # getter for: Lorg/openintents/openpgp/util/OpenPgpAppPreference;->mList:Ljava/util/ArrayList;
    invoke-static {v1}, Lorg/openintents/openpgp/util/OpenPgpAppPreference;->access$000(Lorg/openintents/openpgp/util/OpenPgpAppPreference;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;

    .line 117
    .local v0, "entry":Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;
    # getter for: Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;->intent:Landroid/content/Intent;
    invoke-static {v0}, Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;->access$200(Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;)Landroid/content/Intent;

    move-result-object v1

    if-eqz v1, :cond_20

    .line 127
    iget-object v1, p0, Lorg/openintents/openpgp/util/OpenPgpAppPreference$2;->this$0:Lorg/openintents/openpgp/util/OpenPgpAppPreference;

    invoke-virtual {v1}, Lorg/openintents/openpgp/util/OpenPgpAppPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    # getter for: Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;->intent:Landroid/content/Intent;
    invoke-static {v0}, Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;->access$200(Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 139
    :goto_1f
    return-void

    .line 131
    :cond_20
    iget-object v1, p0, Lorg/openintents/openpgp/util/OpenPgpAppPreference$2;->this$0:Lorg/openintents/openpgp/util/OpenPgpAppPreference;

    # getter for: Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;->packageName:Ljava/lang/String;
    invoke-static {v0}, Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;->access$400(Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;)Ljava/lang/String;

    move-result-object v2

    # setter for: Lorg/openintents/openpgp/util/OpenPgpAppPreference;->mSelectedPackage:Ljava/lang/String;
    invoke-static {v1, v2}, Lorg/openintents/openpgp/util/OpenPgpAppPreference;->access$302(Lorg/openintents/openpgp/util/OpenPgpAppPreference;Ljava/lang/String;)Ljava/lang/String;

    .line 137
    iget-object v1, p0, Lorg/openintents/openpgp/util/OpenPgpAppPreference$2;->this$0:Lorg/openintents/openpgp/util/OpenPgpAppPreference;

    const/4 v2, -0x1

    invoke-virtual {v1, p1, v2}, Lorg/openintents/openpgp/util/OpenPgpAppPreference;->onClick(Landroid/content/DialogInterface;I)V

    .line 138
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    goto :goto_1f
.end method
