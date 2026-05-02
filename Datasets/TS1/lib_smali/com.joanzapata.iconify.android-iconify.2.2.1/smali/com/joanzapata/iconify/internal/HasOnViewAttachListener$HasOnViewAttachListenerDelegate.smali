.class public Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$HasOnViewAttachListenerDelegate;
.super Ljava/lang/Object;
.source "HasOnViewAttachListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/joanzapata/iconify/internal/HasOnViewAttachListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "HasOnViewAttachListenerDelegate"
.end annotation


# instance fields
.field private listener:Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$OnViewAttachListener;

.field private final view:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/widget/TextView;)V
    .registers 2
    .param p1, "view"    # Landroid/widget/TextView;

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object p1, p0, Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$HasOnViewAttachListenerDelegate;->view:Landroid/widget/TextView;

    .line 61
    return-void
.end method


# virtual methods
.method public onAttachedToWindow()V
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$HasOnViewAttachListenerDelegate;->listener:Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$OnViewAttachListener;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$HasOnViewAttachListenerDelegate;->listener:Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$OnViewAttachListener;

    invoke-interface {v0}, Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$OnViewAttachListener;->onAttach()V

    .line 74
    :cond_9
    return-void
.end method

.method public onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 77
    iget-object v0, p0, Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$HasOnViewAttachListenerDelegate;->listener:Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$OnViewAttachListener;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$HasOnViewAttachListenerDelegate;->listener:Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$OnViewAttachListener;

    invoke-interface {v0}, Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$OnViewAttachListener;->onDetach()V

    .line 78
    :cond_9
    return-void
.end method

.method public setOnViewAttachListener(Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$OnViewAttachListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$OnViewAttachListener;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$HasOnViewAttachListenerDelegate;->listener:Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$OnViewAttachListener;

    if-eqz v0, :cond_9

    .line 65
    iget-object v0, p0, Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$HasOnViewAttachListenerDelegate;->listener:Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$OnViewAttachListener;

    invoke-interface {v0}, Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$OnViewAttachListener;->onDetach()V

    .line 66
    :cond_9
    iput-object p1, p0, Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$HasOnViewAttachListenerDelegate;->listener:Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$OnViewAttachListener;

    .line 67
    iget-object v0, p0, Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$HasOnViewAttachListenerDelegate;->view:Landroid/widget/TextView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->isAttachedToWindow(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_18

    if-eqz p1, :cond_18

    .line 68
    invoke-interface {p1}, Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$OnViewAttachListener;->onAttach()V

    .line 70
    :cond_18
    return-void
.end method
