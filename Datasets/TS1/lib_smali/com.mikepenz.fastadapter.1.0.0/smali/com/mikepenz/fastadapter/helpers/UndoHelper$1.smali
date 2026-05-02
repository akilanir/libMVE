.class Lcom/mikepenz/fastadapter/helpers/UndoHelper$1;
.super Ljava/lang/Object;
.source "UndoHelper.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mikepenz/fastadapter/helpers/UndoHelper;->remove(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;ILjava/util/Set;)Landroid/support/design/widget/Snackbar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mikepenz/fastadapter/helpers/UndoHelper;


# direct methods
.method constructor <init>(Lcom/mikepenz/fastadapter/helpers/UndoHelper;)V
    .registers 2
    .param p1, "this$0"    # Lcom/mikepenz/fastadapter/helpers/UndoHelper;

    .prologue
    .line 76
    .local p0, "this":Lcom/mikepenz/fastadapter/helpers/UndoHelper$1;, "Lcom/mikepenz/fastadapter/helpers/UndoHelper$1;"
    iput-object p1, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper$1;->this$0:Lcom/mikepenz/fastadapter/helpers/UndoHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 79
    .local p0, "this":Lcom/mikepenz/fastadapter/helpers/UndoHelper$1;, "Lcom/mikepenz/fastadapter/helpers/UndoHelper$1;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper$1;->this$0:Lcom/mikepenz/fastadapter/helpers/UndoHelper;

    # invokes: Lcom/mikepenz/fastadapter/helpers/UndoHelper;->undoChange()V
    invoke-static {v0}, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->access$100(Lcom/mikepenz/fastadapter/helpers/UndoHelper;)V

    .line 80
    return-void
.end method
