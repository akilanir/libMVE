.class Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity$1;
.super Ljava/lang/Object;
.source "DefaultErrorActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;

.field final synthetic val$restartActivityClass:Ljava/lang/Class;


# direct methods
.method constructor <init>(Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;Ljava/lang/Class;)V
    .registers 3

    .prologue
    .line 55
    iput-object p1, p0, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity$1;->this$0:Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;

    iput-object p2, p0, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity$1;->val$restartActivityClass:Ljava/lang/Class;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 58
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity$1;->this$0:Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;

    iget-object v2, p0, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity$1;->val$restartActivityClass:Ljava/lang/Class;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 59
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity$1;->this$0:Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;

    invoke-static {v1, v0}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->restartApplicationWithIntent(Landroid/app/Activity;Landroid/content/Intent;)V

    .line 60
    return-void
.end method
