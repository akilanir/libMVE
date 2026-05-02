.class Lrx/android/operators/OperatorCompoundButtonInput$2;
.super Ljava/lang/Object;
.source "OperatorCompoundButtonInput.java"

# interfaces
.implements Lrx/functions/Action0;


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

.field final synthetic val$composite:Lrx/android/operators/OperatorCompoundButtonInput$CompositeOnCheckedChangeListener;

.field final synthetic val$listener:Landroid/widget/CompoundButton$OnCheckedChangeListener;


# direct methods
.method constructor <init>(Lrx/android/operators/OperatorCompoundButtonInput;Lrx/android/operators/OperatorCompoundButtonInput$CompositeOnCheckedChangeListener;Landroid/widget/CompoundButton$OnCheckedChangeListener;)V
    .registers 4

    .prologue
    .line 52
    iput-object p1, p0, Lrx/android/operators/OperatorCompoundButtonInput$2;->this$0:Lrx/android/operators/OperatorCompoundButtonInput;

    iput-object p2, p0, Lrx/android/operators/OperatorCompoundButtonInput$2;->val$composite:Lrx/android/operators/OperatorCompoundButtonInput$CompositeOnCheckedChangeListener;

    iput-object p3, p0, Lrx/android/operators/OperatorCompoundButtonInput$2;->val$listener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()V
    .registers 3

    .prologue
    .line 55
    iget-object v0, p0, Lrx/android/operators/OperatorCompoundButtonInput$2;->val$composite:Lrx/android/operators/OperatorCompoundButtonInput$CompositeOnCheckedChangeListener;

    iget-object v1, p0, Lrx/android/operators/OperatorCompoundButtonInput$2;->val$listener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v0, v1}, Lrx/android/operators/OperatorCompoundButtonInput$CompositeOnCheckedChangeListener;->removeOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)Z

    .line 56
    return-void
.end method
