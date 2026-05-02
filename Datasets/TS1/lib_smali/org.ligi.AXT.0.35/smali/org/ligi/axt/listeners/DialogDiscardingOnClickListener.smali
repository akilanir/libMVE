.class public Lorg/ligi/axt/listeners/DialogDiscardingOnClickListener;
.super Ljava/lang/Object;
.source "DialogDiscardingOnClickListener.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 28
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 29
    return-void
.end method
