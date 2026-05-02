.class final Lorg/ligi/tracedroid/sending/TraceDroidEmailSender$2;
.super Ljava/lang/Object;
.source "TraceDroidEmailSender.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/ligi/tracedroid/sending/TraceDroidEmailSender;->sendStackTraces(Ljava/lang/String;Landroid/content/Context;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "whichButton"    # I

    .prologue
    .line 31
    invoke-static {}, Lorg/ligi/tracedroid/TraceDroid;->deleteStacktraceFiles()V

    .line 32
    return-void
.end method
