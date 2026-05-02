.class Lcom/google/zxing/integration/android/IntentIntegrator$1;
.super Ljava/lang/Object;
.source "IntentIntegrator.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/zxing/integration/android/IntentIntegrator;->showDownloadDialog()Landroid/app/AlertDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/zxing/integration/android/IntentIntegrator;


# direct methods
.method constructor <init>(Lcom/google/zxing/integration/android/IntentIntegrator;)V
    .registers 2
    .param p1, "this$0"    # Lcom/google/zxing/integration/android/IntentIntegrator;

    .prologue
    .line 373
    iput-object p1, p0, Lcom/google/zxing/integration/android/IntentIntegrator$1;->this$0:Lcom/google/zxing/integration/android/IntentIntegrator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 10
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;
    .param p2, "i"    # I

    .prologue
    .line 377
    iget-object v4, p0, Lcom/google/zxing/integration/android/IntentIntegrator$1;->this$0:Lcom/google/zxing/integration/android/IntentIntegrator;

    # getter for: Lcom/google/zxing/integration/android/IntentIntegrator;->targetApplications:Ljava/util/List;
    invoke-static {v4}, Lcom/google/zxing/integration/android/IntentIntegrator;->access$000(Lcom/google/zxing/integration/android/IntentIntegrator;)Ljava/util/List;

    move-result-object v4

    const-string v5, "com.google.zxing.client.android"

    invoke-interface {v4, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_40

    .line 379
    const-string v2, "com.google.zxing.client.android"

    .line 384
    .local v2, "packageName":Ljava/lang/String;
    :goto_10
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "market://details?id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 385
    .local v3, "uri":Landroid/net/Uri;
    new-instance v1, Landroid/content/Intent;

    const-string v4, "android.intent.action.VIEW"

    invoke-direct {v1, v4, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 387
    .local v1, "intent":Landroid/content/Intent;
    :try_start_2e
    iget-object v4, p0, Lcom/google/zxing/integration/android/IntentIntegrator$1;->this$0:Lcom/google/zxing/integration/android/IntentIntegrator;

    # getter for: Lcom/google/zxing/integration/android/IntentIntegrator;->fragment:Landroid/app/Fragment;
    invoke-static {v4}, Lcom/google/zxing/integration/android/IntentIntegrator;->access$100(Lcom/google/zxing/integration/android/IntentIntegrator;)Landroid/app/Fragment;

    move-result-object v4

    if-nez v4, :cond_4e

    .line 388
    iget-object v4, p0, Lcom/google/zxing/integration/android/IntentIntegrator$1;->this$0:Lcom/google/zxing/integration/android/IntentIntegrator;

    # getter for: Lcom/google/zxing/integration/android/IntentIntegrator;->activity:Landroid/app/Activity;
    invoke-static {v4}, Lcom/google/zxing/integration/android/IntentIntegrator;->access$200(Lcom/google/zxing/integration/android/IntentIntegrator;)Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_3f
    .catch Landroid/content/ActivityNotFoundException; {:try_start_2e .. :try_end_3f} :catch_58

    .line 396
    :goto_3f
    return-void

    .line 382
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "packageName":Ljava/lang/String;
    .end local v3    # "uri":Landroid/net/Uri;
    :cond_40
    iget-object v4, p0, Lcom/google/zxing/integration/android/IntentIntegrator$1;->this$0:Lcom/google/zxing/integration/android/IntentIntegrator;

    # getter for: Lcom/google/zxing/integration/android/IntentIntegrator;->targetApplications:Ljava/util/List;
    invoke-static {v4}, Lcom/google/zxing/integration/android/IntentIntegrator;->access$000(Lcom/google/zxing/integration/android/IntentIntegrator;)Ljava/util/List;

    move-result-object v4

    const/4 v5, 0x0

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .restart local v2    # "packageName":Ljava/lang/String;
    goto :goto_10

    .line 390
    .restart local v1    # "intent":Landroid/content/Intent;
    .restart local v3    # "uri":Landroid/net/Uri;
    :cond_4e
    :try_start_4e
    iget-object v4, p0, Lcom/google/zxing/integration/android/IntentIntegrator$1;->this$0:Lcom/google/zxing/integration/android/IntentIntegrator;

    # getter for: Lcom/google/zxing/integration/android/IntentIntegrator;->fragment:Landroid/app/Fragment;
    invoke-static {v4}, Lcom/google/zxing/integration/android/IntentIntegrator;->access$100(Lcom/google/zxing/integration/android/IntentIntegrator;)Landroid/app/Fragment;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/app/Fragment;->startActivity(Landroid/content/Intent;)V
    :try_end_57
    .catch Landroid/content/ActivityNotFoundException; {:try_start_4e .. :try_end_57} :catch_58

    goto :goto_3f

    .line 392
    :catch_58
    move-exception v0

    .line 394
    .local v0, "anfe":Landroid/content/ActivityNotFoundException;
    # getter for: Lcom/google/zxing/integration/android/IntentIntegrator;->TAG:Ljava/lang/String;
    invoke-static {}, Lcom/google/zxing/integration/android/IntentIntegrator;->access$300()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Google Play is not installed; cannot install "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3f
.end method
