.class Lrx/android/operators/OperatorViewClick$1;
.super Ljava/lang/Object;
.source "OperatorViewClick.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/android/operators/OperatorViewClick;->call(Lrx/Subscriber;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lrx/android/operators/OperatorViewClick;

.field final synthetic val$observer:Lrx/Subscriber;


# direct methods
.method constructor <init>(Lrx/android/operators/OperatorViewClick;Lrx/Subscriber;)V
    .registers 3

    .prologue
    .line 44
    iput-object p1, p0, Lrx/android/operators/OperatorViewClick$1;->this$0:Lrx/android/operators/OperatorViewClick;

    iput-object p2, p0, Lrx/android/operators/OperatorViewClick$1;->val$observer:Lrx/Subscriber;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "clicked"    # Landroid/view/View;

    .prologue
    .line 47
    iget-object v0, p0, Lrx/android/operators/OperatorViewClick$1;->val$observer:Lrx/Subscriber;

    new-instance v1, Lrx/android/events/OnClickEvent;

    iget-object v2, p0, Lrx/android/operators/OperatorViewClick$1;->this$0:Lrx/android/operators/OperatorViewClick;

    # getter for: Lrx/android/operators/OperatorViewClick;->view:Landroid/view/View;
    invoke-static {v2}, Lrx/android/operators/OperatorViewClick;->access$000(Lrx/android/operators/OperatorViewClick;)Landroid/view/View;

    move-result-object v2

    invoke-direct {v1, v2}, Lrx/android/events/OnClickEvent;-><init>(Landroid/view/View;)V

    invoke-virtual {v0, v1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 48
    return-void
.end method
