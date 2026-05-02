.class public abstract Lcom/nispok/snackbar/listeners/EventListenerAdapter;
.super Ljava/lang/Object;
.source "EventListenerAdapter.java"

# interfaces
.implements Lcom/nispok/snackbar/listeners/EventListener;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Lcom/nispok/snackbar/Snackbar;)V
    .registers 2
    .param p1, "snackbar"    # Lcom/nispok/snackbar/Snackbar;

    .prologue
    .line 41
    return-void
.end method

.method public onDismissByReplace(Lcom/nispok/snackbar/Snackbar;)V
    .registers 2
    .param p1, "snackbar"    # Lcom/nispok/snackbar/Snackbar;

    .prologue
    .line 49
    return-void
.end method

.method public onDismissed(Lcom/nispok/snackbar/Snackbar;)V
    .registers 2
    .param p1, "snackbar"    # Lcom/nispok/snackbar/Snackbar;

    .prologue
    .line 57
    return-void
.end method

.method public onShow(Lcom/nispok/snackbar/Snackbar;)V
    .registers 2
    .param p1, "snackbar"    # Lcom/nispok/snackbar/Snackbar;

    .prologue
    .line 17
    return-void
.end method

.method public onShowByReplace(Lcom/nispok/snackbar/Snackbar;)V
    .registers 2
    .param p1, "snackbar"    # Lcom/nispok/snackbar/Snackbar;

    .prologue
    .line 25
    return-void
.end method

.method public onShown(Lcom/nispok/snackbar/Snackbar;)V
    .registers 2
    .param p1, "snackbar"    # Lcom/nispok/snackbar/Snackbar;

    .prologue
    .line 33
    return-void
.end method
