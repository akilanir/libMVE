.class Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity$1;
.super Ljava/lang/Object;
.source "RefreshingStringBaseListActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;


# direct methods
.method constructor <init>(Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;)V
    .registers 2
    .param p1, "this$0"    # Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;

    .prologue
    .line 100
    iput-object p1, p0, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity$1;->this$0:Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 102
    iget-object v0, p0, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity$1;->this$0:Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;

    # getter for: Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;->adapter:Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity$myArrayAdapter;
    invoke-static {v0}, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;->access$000(Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;)Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity$myArrayAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity$myArrayAdapter;->notifyDataSetChanged()V

    .line 103
    return-void
.end method
