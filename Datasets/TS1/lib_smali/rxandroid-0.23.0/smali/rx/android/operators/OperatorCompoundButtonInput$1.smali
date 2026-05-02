.class Lrx/android/operators/OperatorCompoundButtonInput$1;
.super Ljava/lang/Object;
.source "OperatorCompoundButtonInput.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/android/operators/OperatorCompoundButtonInput;->call(Lrx/Subscriber;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lrx/android/operators/OperatorCompoundButtonInput;

.field final synthetic val$observer:Lrx/Subscriber;


# direct methods
.method constructor <init>(Lrx/android/operators/OperatorCompoundButtonInput;Lrx/Subscriber;)V
    .registers 3

    .prologue
    .line 45
    iput-object p1, p0, Lrx/android/operators/OperatorCompoundButtonInput$1;->this$0:Lrx/android/operators/OperatorCompoundButtonInput;

    iput-object p2, p0, Lrx/android/operators/OperatorCompoundButtonInput$1;->val$observer:Lrx/Subscriber;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 6
    .param p1, "view"    # Landroid/widget/CompoundButton;
    .param p2, "checked"    # Z

    .prologue
    .line 48
    iget-object v0, p0, Lrx/android/operators/OperatorCompoundButtonInput$1;->val$observer:Lrx/Subscriber;

    new-instance v1, Lrx/android/events/OnCheckedChangeEvent;

    iget-object v2, p0, Lrx/android/operators/OperatorCompoundButtonInput$1;->this$0:Lrx/android/operators/OperatorCompoundButtonInput;

    # getter for: Lrx/android/operators/OperatorCompoundButtonInput;->button:Landroid/widget/CompoundButton;
    invoke-static {v2}, Lrx/android/operators/OperatorCompoundButtonInput;->access$000(Lrx/android/operators/OperatorCompoundButtonInput;)Landroid/widget/CompoundButton;

    move-result-object v2

    invoke-direct {v1, v2, p2}, Lrx/android/events/OnCheckedChangeEvent;-><init>(Landroid/widget/CompoundButton;Z)V

    invoke-virtual {v0, v1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 49
    return-void
.end method
