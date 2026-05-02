.class Lorg/ligi/axt/extensions/ViewAXT$1;
.super Ljava/lang/Object;
.source "ViewAXT.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/ligi/axt/extensions/ViewAXT;->startIntentOnClick(Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/ligi/axt/extensions/ViewAXT;

.field final synthetic val$intent:Landroid/content/Intent;


# direct methods
.method constructor <init>(Lorg/ligi/axt/extensions/ViewAXT;Landroid/content/Intent;)V
    .registers 3
    .param p1, "this$0"    # Lorg/ligi/axt/extensions/ViewAXT;

    .prologue
    .line 61
    iput-object p1, p0, Lorg/ligi/axt/extensions/ViewAXT$1;->this$0:Lorg/ligi/axt/extensions/ViewAXT;

    iput-object p2, p0, Lorg/ligi/axt/extensions/ViewAXT$1;->val$intent:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 64
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lorg/ligi/axt/extensions/ViewAXT$1;->val$intent:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 65
    return-void
.end method
