.class Lrx/android/operators/OperatorTextViewInput$2;
.super Ljava/lang/Object;
.source "OperatorTextViewInput.java"

# interfaces
.implements Lrx/functions/Action0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/android/operators/OperatorTextViewInput;->call(Lrx/Subscriber;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lrx/android/operators/OperatorTextViewInput;

.field final synthetic val$watcher:Landroid/text/TextWatcher;


# direct methods
.method constructor <init>(Lrx/android/operators/OperatorTextViewInput;Landroid/text/TextWatcher;)V
    .registers 3

    .prologue
    .line 46
    iput-object p1, p0, Lrx/android/operators/OperatorTextViewInput$2;->this$0:Lrx/android/operators/OperatorTextViewInput;

    iput-object p2, p0, Lrx/android/operators/OperatorTextViewInput$2;->val$watcher:Landroid/text/TextWatcher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()V
    .registers 3

    .prologue
    .line 49
    iget-object v0, p0, Lrx/android/operators/OperatorTextViewInput$2;->this$0:Lrx/android/operators/OperatorTextViewInput;

    # getter for: Lrx/android/operators/OperatorTextViewInput;->input:Landroid/widget/TextView;
    invoke-static {v0}, Lrx/android/operators/OperatorTextViewInput;->access$100(Lrx/android/operators/OperatorTextViewInput;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lrx/android/operators/OperatorTextViewInput$2;->val$watcher:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 50
    return-void
.end method
