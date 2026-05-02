.class Lcom/joanzapata/iconify/internal/ParsingUtil$1$1;
.super Ljava/lang/Object;
.source "ParsingUtil.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/joanzapata/iconify/internal/ParsingUtil$1;->onAttach()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/joanzapata/iconify/internal/ParsingUtil$1;


# direct methods
.method constructor <init>(Lcom/joanzapata/iconify/internal/ParsingUtil$1;)V
    .registers 2
    .param p1, "this$0"    # Lcom/joanzapata/iconify/internal/ParsingUtil$1;

    .prologue
    .line 57
    iput-object p1, p0, Lcom/joanzapata/iconify/internal/ParsingUtil$1$1;->this$0:Lcom/joanzapata/iconify/internal/ParsingUtil$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 60
    iget-object v0, p0, Lcom/joanzapata/iconify/internal/ParsingUtil$1$1;->this$0:Lcom/joanzapata/iconify/internal/ParsingUtil$1;

    iget-boolean v0, v0, Lcom/joanzapata/iconify/internal/ParsingUtil$1;->isAttached:Z

    if-eqz v0, :cond_14

    .line 61
    iget-object v0, p0, Lcom/joanzapata/iconify/internal/ParsingUtil$1$1;->this$0:Lcom/joanzapata/iconify/internal/ParsingUtil$1;

    iget-object v0, v0, Lcom/joanzapata/iconify/internal/ParsingUtil$1;->val$target:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->invalidate()V

    .line 62
    iget-object v0, p0, Lcom/joanzapata/iconify/internal/ParsingUtil$1$1;->this$0:Lcom/joanzapata/iconify/internal/ParsingUtil$1;

    iget-object v0, v0, Lcom/joanzapata/iconify/internal/ParsingUtil$1;->val$target:Landroid/widget/TextView;

    invoke-static {v0, p0}, Landroid/support/v4/view/ViewCompat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 64
    :cond_14
    return-void
.end method
