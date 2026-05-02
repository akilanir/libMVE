.class Lrx/android/operators/OperatorTextViewInput$1;
.super Lrx/android/operators/OperatorTextViewInput$SimpleTextWatcher;
.source "OperatorTextViewInput.java"


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

.field final synthetic val$observer:Lrx/Subscriber;


# direct methods
.method constructor <init>(Lrx/android/operators/OperatorTextViewInput;Lrx/Subscriber;)V
    .registers 4

    .prologue
    .line 39
    iput-object p1, p0, Lrx/android/operators/OperatorTextViewInput$1;->this$0:Lrx/android/operators/OperatorTextViewInput;

    iput-object p2, p0, Lrx/android/operators/OperatorTextViewInput$1;->val$observer:Lrx/Subscriber;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lrx/android/operators/OperatorTextViewInput$SimpleTextWatcher;-><init>(Lrx/android/operators/OperatorTextViewInput$1;)V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 5
    .param p1, "editable"    # Landroid/text/Editable;

    .prologue
    .line 42
    iget-object v0, p0, Lrx/android/operators/OperatorTextViewInput$1;->val$observer:Lrx/Subscriber;

    new-instance v1, Lrx/android/events/OnTextChangeEvent;

    iget-object v2, p0, Lrx/android/operators/OperatorTextViewInput$1;->this$0:Lrx/android/operators/OperatorTextViewInput;

    # getter for: Lrx/android/operators/OperatorTextViewInput;->input:Landroid/widget/TextView;
    invoke-static {v2}, Lrx/android/operators/OperatorTextViewInput;->access$100(Lrx/android/operators/OperatorTextViewInput;)Landroid/widget/TextView;

    move-result-object v2

    invoke-direct {v1, v2}, Lrx/android/events/OnTextChangeEvent;-><init>(Landroid/widget/TextView;)V

    invoke-virtual {v0, v1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 43
    return-void
.end method
