.class public Lorg/ligi/axt/extensions/misc/CommonIntentStarter;
.super Ljava/lang/Object;
.source "CommonIntentStarter.java"


# instance fields
.field private asNewTask:Z

.field public final context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/ligi/axt/extensions/misc/CommonIntentStarter;->asNewTask:Z

    .line 14
    iput-object p1, p0, Lorg/ligi/axt/extensions/misc/CommonIntentStarter;->context:Landroid/content/Context;

    .line 15
    return-void
.end method

.method private start(Landroid/content/Intent;)V
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 41
    iget-boolean v0, p0, Lorg/ligi/axt/extensions/misc/CommonIntentStarter;->asNewTask:Z

    if-eqz v0, :cond_9

    .line 42
    const/high16 v0, 0x10000000

    invoke-virtual {p1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 44
    :cond_9
    iget-object v0, p0, Lorg/ligi/axt/extensions/misc/CommonIntentStarter;->context:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 45
    return-void
.end method


# virtual methods
.method public activityFromClass(Ljava/lang/Class;)V
    .registers 4
    .param p1, "class2start"    # Ljava/lang/Class;

    .prologue
    .line 31
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lorg/ligi/axt/extensions/misc/CommonIntentStarter;->context:Landroid/content/Context;

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 32
    .local v0, "intent":Landroid/content/Intent;
    invoke-direct {p0, v0}, Lorg/ligi/axt/extensions/misc/CommonIntentStarter;->start(Landroid/content/Intent;)V

    .line 33
    return-void
.end method

.method public noNewTask()Lorg/ligi/axt/extensions/misc/CommonIntentStarter;
    .registers 2

    .prologue
    .line 36
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/ligi/axt/extensions/misc/CommonIntentStarter;->asNewTask:Z

    .line 37
    return-object p0
.end method

.method public openUrl(Ljava/lang/String;)V
    .registers 4
    .param p1, "urlString"    # Ljava/lang/String;

    .prologue
    .line 18
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 19
    .local v0, "intent":Landroid/content/Intent;
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 20
    invoke-direct {p0, v0}, Lorg/ligi/axt/extensions/misc/CommonIntentStarter;->start(Landroid/content/Intent;)V

    .line 21
    return-void
.end method

.method public shareUrl(Ljava/lang/String;)V
    .registers 4
    .param p1, "urlString"    # Ljava/lang/String;

    .prologue
    .line 24
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SEND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 25
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "android.intent.extra.TEXT"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 26
    const-string v1, "text/plain"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 27
    invoke-direct {p0, v0}, Lorg/ligi/axt/extensions/misc/CommonIntentStarter;->start(Landroid/content/Intent;)V

    .line 28
    return-void
.end method
