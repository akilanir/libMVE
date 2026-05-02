.class Lcom/afollestad/materialdialogs/MaterialDialog$2;
.super Ljava/lang/Object;
.source "MaterialDialog.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/afollestad/materialdialogs/MaterialDialog;->setProgress(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/afollestad/materialdialogs/MaterialDialog;


# direct methods
.method constructor <init>(Lcom/afollestad/materialdialogs/MaterialDialog;)V
    .registers 2

    .prologue
    .line 1580
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$2;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .prologue
    .line 1583
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$2;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgressLabel:Landroid/widget/TextView;

    if-eqz v0, :cond_27

    .line 1585
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$2;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgressLabel:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$2;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progressPercentFormat:Ljava/text/NumberFormat;

    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog$2;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v2}, Lcom/afollestad/materialdialogs/MaterialDialog;->getCurrentProgress()I

    move-result v2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog$2;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v3}, Lcom/afollestad/materialdialogs/MaterialDialog;->getMaxProgress()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v2, v3

    float-to-double v2, v2

    invoke-virtual {v1, v2, v3}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1588
    :cond_27
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$2;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgressMinMax:Landroid/widget/TextView;

    if-eqz v0, :cond_5b

    .line 1589
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$2;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgressMinMax:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$2;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progressNumberFormat:Ljava/lang/String;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$2;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v4}, Lcom/afollestad/materialdialogs/MaterialDialog;->getCurrentProgress()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$2;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v4}, Lcom/afollestad/materialdialogs/MaterialDialog;->getMaxProgress()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1592
    :cond_5b
    return-void
.end method
