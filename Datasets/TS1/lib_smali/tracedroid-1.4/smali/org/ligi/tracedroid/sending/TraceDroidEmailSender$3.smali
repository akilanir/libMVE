.class final Lorg/ligi/tracedroid/sending/TraceDroidEmailSender$3;
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


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$email:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .registers 3

    .prologue
    .line 19
    iput-object p1, p0, Lorg/ligi/tracedroid/sending/TraceDroidEmailSender$3;->val$email:Ljava/lang/String;

    iput-object p2, p0, Lorg/ligi/tracedroid/sending/TraceDroidEmailSender$3;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 8
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "whichButton"    # I

    .prologue
    .line 21
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SEND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 22
    .local v0, "emailIntent":Landroid/content/Intent;
    const-string v1, "plain/text"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 23
    const-string v1, "android.intent.extra.EMAIL"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    iget-object v4, p0, Lorg/ligi/tracedroid/sending/TraceDroidEmailSender$3;->val$email:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 24
    const-string v1, "android.intent.extra.SUBJECT"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[TraceDroid Report] "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Lorg/ligi/tracedroid/collecting/TraceDroidMetaInfo;->getAppPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 25
    const-string v1, "android.intent.extra.TEXT"

    const/16 v2, 0xa

    invoke-static {v2}, Lorg/ligi/tracedroid/TraceDroid;->getStackTraceText(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 26
    iget-object v1, p0, Lorg/ligi/tracedroid/sending/TraceDroidEmailSender$3;->val$context:Landroid/content/Context;

    const-string v2, "Send mail..."

    invoke-static {v0, v2}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 27
    invoke-static {}, Lorg/ligi/tracedroid/TraceDroid;->deleteStacktraceFiles()V

    .line 28
    return-void
.end method
