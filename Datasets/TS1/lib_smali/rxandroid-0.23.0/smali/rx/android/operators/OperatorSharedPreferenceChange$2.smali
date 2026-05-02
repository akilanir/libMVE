.class Lrx/android/operators/OperatorSharedPreferenceChange$2;
.super Ljava/lang/Object;
.source "OperatorSharedPreferenceChange.java"

# interfaces
.implements Lrx/functions/Action0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/android/operators/OperatorSharedPreferenceChange;->call(Lrx/Subscriber;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lrx/android/operators/OperatorSharedPreferenceChange;

.field final synthetic val$listener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# direct methods
.method constructor <init>(Lrx/android/operators/OperatorSharedPreferenceChange;Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V
    .registers 3

    .prologue
    .line 39
    iput-object p1, p0, Lrx/android/operators/OperatorSharedPreferenceChange$2;->this$0:Lrx/android/operators/OperatorSharedPreferenceChange;

    iput-object p2, p0, Lrx/android/operators/OperatorSharedPreferenceChange$2;->val$listener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()V
    .registers 3

    .prologue
    .line 42
    iget-object v0, p0, Lrx/android/operators/OperatorSharedPreferenceChange$2;->this$0:Lrx/android/operators/OperatorSharedPreferenceChange;

    # getter for: Lrx/android/operators/OperatorSharedPreferenceChange;->sharedPreferences:Landroid/content/SharedPreferences;
    invoke-static {v0}, Lrx/android/operators/OperatorSharedPreferenceChange;->access$000(Lrx/android/operators/OperatorSharedPreferenceChange;)Landroid/content/SharedPreferences;

    move-result-object v0

    iget-object v1, p0, Lrx/android/operators/OperatorSharedPreferenceChange$2;->val$listener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 43
    return-void
.end method
