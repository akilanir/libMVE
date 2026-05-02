.class Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity$3;
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


# direct methods
.method constructor <init>(Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;)V
    .registers 2

    .prologue
    .line 75
    iput-object p1, p0, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity$3;->this$0:Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 80
    new-instance v2, Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity$3;->this$0:Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v3, Lcat/ereza/customactivityoncrash/R$string;->customactivityoncrash_error_activity_error_details_title:I

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    iget-object v3, p0, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity$3;->this$0:Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;

    iget-object v4, p0, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity$3;->this$0:Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;

    invoke-virtual {v4}, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    invoke-static {v3, v4}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->getAllErrorDetailsFromIntent(Landroid/content/Context;Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    sget v3, Lcat/ereza/customactivityoncrash/R$string;->customactivityoncrash_error_activity_error_details_close:I

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    sget v3, Lcat/ereza/customactivityoncrash/R$string;->customactivityoncrash_error_activity_error_details_copy:I

    new-instance v4, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity$3$1;

    invoke-direct {v4, p0}, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity$3$1;-><init>(Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity$3;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    .line 93
    .local v0, "dialog":Landroid/app/AlertDialog;
    const v2, 0x102000b

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 94
    .local v1, "textView":Landroid/widget/TextView;
    const/4 v2, 0x0

    iget-object v3, p0, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity$3;->this$0:Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;

    invoke-virtual {v3}, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcat/ereza/customactivityoncrash/R$dimen;->customactivityoncrash_error_activity_error_details_text_size:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 95
    return-void
.end method
