.class public Lorg/ligi/axt/listeners/ActivityFinishingOnCancelListener;
.super Ljava/lang/Object;
.source "ActivityFinishingOnCancelListener.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field private final activity2finish:Landroid/app/Activity;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity2close"    # Landroid/app/Activity;

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lorg/ligi/axt/listeners/ActivityFinishingOnCancelListener;->activity2finish:Landroid/app/Activity;

    .line 13
    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .registers 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 17
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 18
    iget-object v0, p0, Lorg/ligi/axt/listeners/ActivityFinishingOnCancelListener;->activity2finish:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 19
    return-void
.end method
