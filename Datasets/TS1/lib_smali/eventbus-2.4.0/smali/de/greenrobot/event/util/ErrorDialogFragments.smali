.class public Lde/greenrobot/event/util/ErrorDialogFragments;
.super Ljava/lang/Object;
.source "ErrorDialogFragments.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/greenrobot/event/util/ErrorDialogFragments$Support;,
        Lde/greenrobot/event/util/ErrorDialogFragments$Honeycomb;
    }
.end annotation


# static fields
.field public static ERROR_DIALOG_ICON:I

.field public static EVENT_TYPE_ON_CLICK:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 17
    const/4 v0, 0x0

    sput v0, Lde/greenrobot/event/util/ErrorDialogFragments;->ERROR_DIALOG_ICON:I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    return-void
.end method

.method public static createDialog(Landroid/content/Context;Landroid/os/Bundle;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/Dialog;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "arguments"    # Landroid/os/Bundle;
    .param p2, "onClickListener"    # Landroid/content/DialogInterface$OnClickListener;

    .prologue
    .line 23
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 24
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const-string v1, "de.greenrobot.eventbus.errordialog.title"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 25
    const-string v1, "de.greenrobot.eventbus.errordialog.message"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 26
    sget v1, Lde/greenrobot/event/util/ErrorDialogFragments;->ERROR_DIALOG_ICON:I

    if-eqz v1, :cond_20

    .line 27
    sget v1, Lde/greenrobot/event/util/ErrorDialogFragments;->ERROR_DIALOG_ICON:I

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 29
    :cond_20
    const v1, 0x104000a

    invoke-virtual {v0, v1, p2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 30
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    return-object v1
.end method

.method public static handleOnClick(Landroid/content/DialogInterface;ILandroid/app/Activity;Landroid/os/Bundle;)V
    .registers 10
    .param p0, "dialog"    # Landroid/content/DialogInterface;
    .param p1, "which"    # I
    .param p2, "activity"    # Landroid/app/Activity;
    .param p3, "arguments"    # Landroid/os/Bundle;

    .prologue
    .line 34
    sget-object v4, Lde/greenrobot/event/util/ErrorDialogFragments;->EVENT_TYPE_ON_CLICK:Ljava/lang/Class;

    if-eqz v4, :cond_15

    .line 37
    :try_start_4
    sget-object v4, Lde/greenrobot/event/util/ErrorDialogFragments;->EVENT_TYPE_ON_CLICK:Ljava/lang/Class;

    invoke-virtual {v4}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_9} :catch_24

    move-result-object v1

    .line 41
    .local v1, "event":Ljava/lang/Object;
    sget-object v4, Lde/greenrobot/event/util/ErrorDialogManager;->factory:Lde/greenrobot/event/util/ErrorDialogFragmentFactory;

    iget-object v4, v4, Lde/greenrobot/event/util/ErrorDialogFragmentFactory;->config:Lde/greenrobot/event/util/ErrorDialogConfig;

    invoke-virtual {v4}, Lde/greenrobot/event/util/ErrorDialogConfig;->getEventBus()Lde/greenrobot/event/EventBus;

    move-result-object v2

    .line 42
    .local v2, "eventBus":Lde/greenrobot/event/EventBus;
    invoke-virtual {v2, v1}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    .line 44
    .end local v1    # "event":Ljava/lang/Object;
    .end local v2    # "eventBus":Lde/greenrobot/event/EventBus;
    :cond_15
    const-string v4, "de.greenrobot.eventbus.errordialog.finish_after_dialog"

    const/4 v5, 0x0

    invoke-virtual {p3, v4, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    .line 45
    .local v3, "finish":Z
    if-eqz v3, :cond_23

    if-eqz p2, :cond_23

    .line 46
    invoke-virtual {p2}, Landroid/app/Activity;->finish()V

    .line 48
    :cond_23
    return-void

    .line 38
    .end local v3    # "finish":Z
    :catch_24
    move-exception v0

    .line 39
    .local v0, "e":Ljava/lang/Exception;
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "Event cannot be constructed"

    invoke-direct {v4, v5, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method
