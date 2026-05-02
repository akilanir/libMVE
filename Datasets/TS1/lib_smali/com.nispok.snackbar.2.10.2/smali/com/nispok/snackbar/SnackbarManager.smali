.class public Lcom/nispok/snackbar/SnackbarManager;
.super Ljava/lang/Object;
.source "SnackbarManager.java"


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static currentSnackbar:Lcom/nispok/snackbar/Snackbar;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 13
    const-class v0, Lcom/nispok/snackbar/SnackbarManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/nispok/snackbar/SnackbarManager;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    return-void
.end method

.method public static dismiss()V
    .registers 1

    .prologue
    .line 96
    sget-object v0, Lcom/nispok/snackbar/SnackbarManager;->currentSnackbar:Lcom/nispok/snackbar/Snackbar;

    if-eqz v0, :cond_9

    .line 97
    sget-object v0, Lcom/nispok/snackbar/SnackbarManager;->currentSnackbar:Lcom/nispok/snackbar/Snackbar;

    invoke-virtual {v0}, Lcom/nispok/snackbar/Snackbar;->dismiss()V

    .line 99
    :cond_9
    return-void
.end method

.method public static getCurrentSnackbar()Lcom/nispok/snackbar/Snackbar;
    .registers 1

    .prologue
    .line 105
    sget-object v0, Lcom/nispok/snackbar/SnackbarManager;->currentSnackbar:Lcom/nispok/snackbar/Snackbar;

    return-object v0
.end method

.method public static show(Lcom/nispok/snackbar/Snackbar;)V
    .registers 4
    .param p0, "snackbar"    # Lcom/nispok/snackbar/Snackbar;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 31
    :try_start_0
    invoke-virtual {p0}, Lcom/nispok/snackbar/Snackbar;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    invoke-static {p0, v1}, Lcom/nispok/snackbar/SnackbarManager;->show(Lcom/nispok/snackbar/Snackbar;Landroid/app/Activity;)V
    :try_end_9
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_9} :catch_a

    .line 36
    :goto_9
    return-void

    .line 32
    :catch_a
    move-exception v0

    .line 33
    .local v0, "e":Ljava/lang/ClassCastException;
    sget-object v1, Lcom/nispok/snackbar/SnackbarManager;->TAG:Ljava/lang/String;

    const-string v2, "Couldn\'t get Activity from the Snackbar\'s Context. Try calling #show(Snackbar, Activity) instead"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_9
.end method

.method public static show(Lcom/nispok/snackbar/Snackbar;Landroid/app/Activity;)V
    .registers 3
    .param p0, "snackbar"    # Lcom/nispok/snackbar/Snackbar;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 46
    sget-object v0, Lcom/nispok/snackbar/SnackbarManager;->currentSnackbar:Lcom/nispok/snackbar/Snackbar;

    if-eqz v0, :cond_26

    .line 47
    sget-object v0, Lcom/nispok/snackbar/SnackbarManager;->currentSnackbar:Lcom/nispok/snackbar/Snackbar;

    invoke-virtual {v0}, Lcom/nispok/snackbar/Snackbar;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_21

    sget-object v0, Lcom/nispok/snackbar/SnackbarManager;->currentSnackbar:Lcom/nispok/snackbar/Snackbar;

    invoke-virtual {v0}, Lcom/nispok/snackbar/Snackbar;->isDimissing()Z

    move-result v0

    if-nez v0, :cond_21

    .line 48
    sget-object v0, Lcom/nispok/snackbar/SnackbarManager;->currentSnackbar:Lcom/nispok/snackbar/Snackbar;

    invoke-virtual {v0}, Lcom/nispok/snackbar/Snackbar;->dismissByReplace()V

    .line 49
    sput-object p0, Lcom/nispok/snackbar/SnackbarManager;->currentSnackbar:Lcom/nispok/snackbar/Snackbar;

    .line 50
    sget-object v0, Lcom/nispok/snackbar/SnackbarManager;->currentSnackbar:Lcom/nispok/snackbar/Snackbar;

    invoke-virtual {v0, p1}, Lcom/nispok/snackbar/Snackbar;->showByReplace(Landroid/app/Activity;)V

    .line 57
    :goto_20
    return-void

    .line 53
    :cond_21
    sget-object v0, Lcom/nispok/snackbar/SnackbarManager;->currentSnackbar:Lcom/nispok/snackbar/Snackbar;

    invoke-virtual {v0}, Lcom/nispok/snackbar/Snackbar;->dismiss()V

    .line 55
    :cond_26
    sput-object p0, Lcom/nispok/snackbar/SnackbarManager;->currentSnackbar:Lcom/nispok/snackbar/Snackbar;

    .line 56
    sget-object v0, Lcom/nispok/snackbar/SnackbarManager;->currentSnackbar:Lcom/nispok/snackbar/Snackbar;

    invoke-virtual {v0, p1}, Lcom/nispok/snackbar/Snackbar;->show(Landroid/app/Activity;)V

    goto :goto_20
.end method

.method public static show(Lcom/nispok/snackbar/Snackbar;Landroid/view/ViewGroup;)V
    .registers 3
    .param p0, "snackbar"    # Lcom/nispok/snackbar/Snackbar;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "parent"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 67
    invoke-virtual {p0}, Lcom/nispok/snackbar/Snackbar;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/nispok/snackbar/Snackbar;->shouldUsePhoneLayout(Landroid/content/Context;)Z

    move-result v0

    invoke-static {p0, p1, v0}, Lcom/nispok/snackbar/SnackbarManager;->show(Lcom/nispok/snackbar/Snackbar;Landroid/view/ViewGroup;Z)V

    .line 68
    return-void
.end method

.method public static show(Lcom/nispok/snackbar/Snackbar;Landroid/view/ViewGroup;Z)V
    .registers 4
    .param p0, "snackbar"    # Lcom/nispok/snackbar/Snackbar;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "parent"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "usePhoneLayout"    # Z

    .prologue
    .line 79
    sget-object v0, Lcom/nispok/snackbar/SnackbarManager;->currentSnackbar:Lcom/nispok/snackbar/Snackbar;

    if-eqz v0, :cond_26

    .line 80
    sget-object v0, Lcom/nispok/snackbar/SnackbarManager;->currentSnackbar:Lcom/nispok/snackbar/Snackbar;

    invoke-virtual {v0}, Lcom/nispok/snackbar/Snackbar;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_21

    sget-object v0, Lcom/nispok/snackbar/SnackbarManager;->currentSnackbar:Lcom/nispok/snackbar/Snackbar;

    invoke-virtual {v0}, Lcom/nispok/snackbar/Snackbar;->isDimissing()Z

    move-result v0

    if-nez v0, :cond_21

    .line 81
    sget-object v0, Lcom/nispok/snackbar/SnackbarManager;->currentSnackbar:Lcom/nispok/snackbar/Snackbar;

    invoke-virtual {v0}, Lcom/nispok/snackbar/Snackbar;->dismissByReplace()V

    .line 82
    sput-object p0, Lcom/nispok/snackbar/SnackbarManager;->currentSnackbar:Lcom/nispok/snackbar/Snackbar;

    .line 83
    sget-object v0, Lcom/nispok/snackbar/SnackbarManager;->currentSnackbar:Lcom/nispok/snackbar/Snackbar;

    invoke-virtual {v0, p1, p2}, Lcom/nispok/snackbar/Snackbar;->showByReplace(Landroid/view/ViewGroup;Z)V

    .line 90
    :goto_20
    return-void

    .line 86
    :cond_21
    sget-object v0, Lcom/nispok/snackbar/SnackbarManager;->currentSnackbar:Lcom/nispok/snackbar/Snackbar;

    invoke-virtual {v0}, Lcom/nispok/snackbar/Snackbar;->dismiss()V

    .line 88
    :cond_26
    sput-object p0, Lcom/nispok/snackbar/SnackbarManager;->currentSnackbar:Lcom/nispok/snackbar/Snackbar;

    .line 89
    sget-object v0, Lcom/nispok/snackbar/SnackbarManager;->currentSnackbar:Lcom/nispok/snackbar/Snackbar;

    invoke-virtual {v0, p1, p2}, Lcom/nispok/snackbar/Snackbar;->show(Landroid/view/ViewGroup;Z)V

    goto :goto_20
.end method
