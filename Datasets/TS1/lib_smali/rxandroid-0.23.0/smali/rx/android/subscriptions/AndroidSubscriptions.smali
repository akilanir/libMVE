.class public final Lrx/android/subscriptions/AndroidSubscriptions;
.super Ljava/lang/Object;
.source "AndroidSubscriptions.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    return-void
.end method

.method public static unsubscribeInUiThread(Lrx/functions/Action0;)Lrx/Subscription;
    .registers 2
    .param p0, "unsubscribe"    # Lrx/functions/Action0;

    .prologue
    .line 37
    new-instance v0, Lrx/android/subscriptions/AndroidSubscriptions$1;

    invoke-direct {v0, p0}, Lrx/android/subscriptions/AndroidSubscriptions$1;-><init>(Lrx/functions/Action0;)V

    invoke-static {v0}, Lrx/subscriptions/Subscriptions;->create(Lrx/functions/Action0;)Lrx/Subscription;

    move-result-object v0

    return-object v0
.end method
