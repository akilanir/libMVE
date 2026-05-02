.class Lrx/android/operators/OperatorAdapterViewOnItemClick$2;
.super Ljava/lang/Object;
.source "OperatorAdapterViewOnItemClick.java"

# interfaces
.implements Lrx/functions/Action0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/android/operators/OperatorAdapterViewOnItemClick;->call(Lrx/Subscriber;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lrx/android/operators/OperatorAdapterViewOnItemClick;

.field final synthetic val$composite:Lrx/android/operators/OperatorAdapterViewOnItemClick$CompositeOnClickListener;

.field final synthetic val$listener:Landroid/widget/AdapterView$OnItemClickListener;


# direct methods
.method constructor <init>(Lrx/android/operators/OperatorAdapterViewOnItemClick;Lrx/android/operators/OperatorAdapterViewOnItemClick$CompositeOnClickListener;Landroid/widget/AdapterView$OnItemClickListener;)V
    .registers 4

    .prologue
    .line 53
    iput-object p1, p0, Lrx/android/operators/OperatorAdapterViewOnItemClick$2;->this$0:Lrx/android/operators/OperatorAdapterViewOnItemClick;

    iput-object p2, p0, Lrx/android/operators/OperatorAdapterViewOnItemClick$2;->val$composite:Lrx/android/operators/OperatorAdapterViewOnItemClick$CompositeOnClickListener;

    iput-object p3, p0, Lrx/android/operators/OperatorAdapterViewOnItemClick$2;->val$listener:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()V
    .registers 3

    .prologue
    .line 56
    iget-object v0, p0, Lrx/android/operators/OperatorAdapterViewOnItemClick$2;->val$composite:Lrx/android/operators/OperatorAdapterViewOnItemClick$CompositeOnClickListener;

    iget-object v1, p0, Lrx/android/operators/OperatorAdapterViewOnItemClick$2;->val$listener:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v0, v1}, Lrx/android/operators/OperatorAdapterViewOnItemClick$CompositeOnClickListener;->removeOnClickListener(Landroid/widget/AdapterView$OnItemClickListener;)Z

    .line 57
    return-void
.end method
