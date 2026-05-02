.class public Lorg/ligi/tracedroid/sending/TraceDroidEmailSender;
.super Ljava/lang/Object;
.source "TraceDroidEmailSender.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static sendStackTraces(Ljava/lang/String;Landroid/content/Context;)Z
    .registers 5
    .param p0, "email"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 15
    invoke-static {}, Lorg/ligi/tracedroid/TraceDroid;->getStackTraceFiles()[Ljava/io/File;

    move-result-object v0

    array-length v0, v0

    if-lez v0, :cond_3e

    .line 16
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "Problem Report"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "A Problem with this App was detected - would you send an Crash-Report to help fixing this Problem?"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Send"

    new-instance v2, Lorg/ligi/tracedroid/sending/TraceDroidEmailSender$3;

    invoke-direct {v2, p0, p1}, Lorg/ligi/tracedroid/sending/TraceDroidEmailSender$3;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "No"

    new-instance v2, Lorg/ligi/tracedroid/sending/TraceDroidEmailSender$2;

    invoke-direct {v2}, Lorg/ligi/tracedroid/sending/TraceDroidEmailSender$2;-><init>()V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Later"

    new-instance v2, Lorg/ligi/tracedroid/sending/TraceDroidEmailSender$1;

    invoke-direct {v2}, Lorg/ligi/tracedroid/sending/TraceDroidEmailSender$1;-><init>()V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 41
    const/4 v0, 0x1

    .line 43
    :goto_3d
    return v0

    :cond_3e
    const/4 v0, 0x0

    goto :goto_3d
.end method
