.class Lrx/android/operators/OperatorViewClick$2;
.super Ljava/lang/Object;
.source "OperatorViewClick.java"

# interfaces
.implements Lrx/functions/Action0;


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

.field final synthetic val$composite:Lrx/android/operators/OperatorViewClick$CompositeOnClickListener;

.field final synthetic val$listener:Landroid/view/View$OnClickListener;


# direct methods
.method constructor <init>(Lrx/android/operators/OperatorViewClick;Lrx/android/operators/OperatorViewClick$CompositeOnClickListener;Landroid/view/View$OnClickListener;)V
    .registers 4

    .prologue
    .line 51
    iput-object p1, p0, Lrx/android/operators/OperatorViewClick$2;->this$0:Lrx/android/operators/OperatorViewClick;

    iput-object p2, p0, Lrx/android/operators/OperatorViewClick$2;->val$composite:Lrx/android/operators/OperatorViewClick$CompositeOnClickListener;

    iput-object p3, p0, Lrx/android/operators/OperatorViewClick$2;->val$listener:Landroid/view/View$OnClickListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()V
    .registers 3

    .prologue
    .line 54
    iget-object v0, p0, Lrx/android/operators/OperatorViewClick$2;->val$composite:Lrx/android/operators/OperatorViewClick$CompositeOnClickListener;

    iget-object v1, p0, Lrx/android/operators/OperatorViewClick$2;->val$listener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Lrx/android/operators/OperatorViewClick$CompositeOnClickListener;->removeOnClickListener(Landroid/view/View$OnClickListener;)Z

    .line 55
    return-void
.end method
