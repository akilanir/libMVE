.class Lorg/piwik/sdk/TrackerBulkURLWrapper$1;
.super Ljava/lang/Object;
.source "TrackerBulkURLWrapper.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/piwik/sdk/TrackerBulkURLWrapper;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/piwik/sdk/TrackerBulkURLWrapper;


# direct methods
.method constructor <init>(Lorg/piwik/sdk/TrackerBulkURLWrapper;)V
    .registers 2
    .param p1, "this$0"    # Lorg/piwik/sdk/TrackerBulkURLWrapper;

    .line 51
    iput-object p1, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper$1;->this$0:Lorg/piwik/sdk/TrackerBulkURLWrapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 3

    .line 54
    iget-object v0, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper$1;->this$0:Lorg/piwik/sdk/TrackerBulkURLWrapper;

    # getter for: Lorg/piwik/sdk/TrackerBulkURLWrapper;->mCurrentPage:I
    invoke-static {v0}, Lorg/piwik/sdk/TrackerBulkURLWrapper;->access$000(Lorg/piwik/sdk/TrackerBulkURLWrapper;)I

    move-result v0

    iget-object v1, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper$1;->this$0:Lorg/piwik/sdk/TrackerBulkURLWrapper;

    # getter for: Lorg/piwik/sdk/TrackerBulkURLWrapper;->mPages:I
    invoke-static {v1}, Lorg/piwik/sdk/TrackerBulkURLWrapper;->access$100(Lorg/piwik/sdk/TrackerBulkURLWrapper;)I

    move-result v1

    if-ge v0, v1, :cond_10

    const/4 v0, 0x1

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    :goto_11
    return v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .registers 2

    .line 51
    invoke-virtual {p0}, Lorg/piwik/sdk/TrackerBulkURLWrapper$1;->next()Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;

    move-result-object v0

    return-object v0
.end method

.method public next()Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;
    .registers 4

    .line 59
    invoke-virtual {p0}, Lorg/piwik/sdk/TrackerBulkURLWrapper$1;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 60
    new-instance v0, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;

    iget-object v1, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper$1;->this$0:Lorg/piwik/sdk/TrackerBulkURLWrapper;

    iget-object v2, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper$1;->this$0:Lorg/piwik/sdk/TrackerBulkURLWrapper;

    # operator++ for: Lorg/piwik/sdk/TrackerBulkURLWrapper;->mCurrentPage:I
    invoke-static {v2}, Lorg/piwik/sdk/TrackerBulkURLWrapper;->access$008(Lorg/piwik/sdk/TrackerBulkURLWrapper;)I

    move-result v2

    invoke-direct {v0, v1, v2}, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;-><init>(Lorg/piwik/sdk/TrackerBulkURLWrapper;I)V

    return-object v0

    .line 62
    :cond_14
    const/4 v0, 0x0

    return-object v0
.end method

.method public remove()V
    .registers 1

    .line 67
    return-void
.end method
