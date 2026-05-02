.class Lrx/android/subscriptions/AndroidSubscriptions$1$1;
.super Ljava/lang/Object;
.source "AndroidSubscriptions.java"

# interfaces
.implements Lrx/functions/Action0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/android/subscriptions/AndroidSubscriptions$1;->call()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lrx/android/subscriptions/AndroidSubscriptions$1;

.field final synthetic val$inner:Lrx/Scheduler$Worker;


# direct methods
.method constructor <init>(Lrx/android/subscriptions/AndroidSubscriptions$1;Lrx/Scheduler$Worker;)V
    .registers 3

    .prologue
    .line 44
    iput-object p1, p0, Lrx/android/subscriptions/AndroidSubscriptions$1$1;->this$0:Lrx/android/subscriptions/AndroidSubscriptions$1;

    iput-object p2, p0, Lrx/android/subscriptions/AndroidSubscriptions$1$1;->val$inner:Lrx/Scheduler$Worker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()V
    .registers 2

    .prologue
    .line 47
    iget-object v0, p0, Lrx/android/subscriptions/AndroidSubscriptions$1$1;->this$0:Lrx/android/subscriptions/AndroidSubscriptions$1;

    iget-object v0, v0, Lrx/android/subscriptions/AndroidSubscriptions$1;->val$unsubscribe:Lrx/functions/Action0;

    invoke-interface {v0}, Lrx/functions/Action0;->call()V

    .line 48
    iget-object v0, p0, Lrx/android/subscriptions/AndroidSubscriptions$1$1;->val$inner:Lrx/Scheduler$Worker;

    invoke-virtual {v0}, Lrx/Scheduler$Worker;->unsubscribe()V

    .line 49
    return-void
.end method
