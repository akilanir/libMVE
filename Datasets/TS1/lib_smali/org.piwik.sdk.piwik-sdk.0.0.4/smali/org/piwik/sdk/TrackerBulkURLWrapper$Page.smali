.class public final Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;
.super Ljava/lang/Object;
.source "TrackerBulkURLWrapper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/piwik/sdk/TrackerBulkURLWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Page"
.end annotation


# instance fields
.field protected final fromIndex:I

.field final synthetic this$0:Lorg/piwik/sdk/TrackerBulkURLWrapper;

.field protected final toIndex:I


# direct methods
.method protected constructor <init>(Lorg/piwik/sdk/TrackerBulkURLWrapper;I)V
    .registers 5
    .param p1, "this$0"    # Lorg/piwik/sdk/TrackerBulkURLWrapper;
    .param p2, "pageNumber"    # I

    .line 135
    iput-object p1, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->this$0:Lorg/piwik/sdk/TrackerBulkURLWrapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 136
    if-gez p2, :cond_13

    # getter for: Lorg/piwik/sdk/TrackerBulkURLWrapper;->mPages:I
    invoke-static {p1}, Lorg/piwik/sdk/TrackerBulkURLWrapper;->access$100(Lorg/piwik/sdk/TrackerBulkURLWrapper;)I

    move-result v0

    if-lt p2, v0, :cond_13

    .line 137
    const/4 v0, -0x1

    iput v0, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->toIndex:I

    iput v0, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->fromIndex:I

    .line 138
    return-void

    .line 140
    :cond_13
    mul-int/lit8 v0, p2, 0x14

    iput v0, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->fromIndex:I

    .line 141
    iget v0, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->fromIndex:I

    add-int/lit8 v0, v0, 0x14

    # getter for: Lorg/piwik/sdk/TrackerBulkURLWrapper;->mEvents:Ljava/util/List;
    invoke-static {p1}, Lorg/piwik/sdk/TrackerBulkURLWrapper;->access$200(Lorg/piwik/sdk/TrackerBulkURLWrapper;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->toIndex:I

    .line 142
    return-void
.end method


# virtual methods
.method public elementsCount()I
    .registers 3

    .line 145
    iget v0, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->toIndex:I

    iget v1, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->fromIndex:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public isEmpty()Z
    .registers 3

    .line 149
    iget v0, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->fromIndex:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_e

    invoke-virtual {p0}, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->elementsCount()I

    move-result v0

    if-nez v0, :cond_c

    goto :goto_e

    :cond_c
    const/4 v0, 0x0

    goto :goto_f

    :cond_e
    :goto_e
    const/4 v0, 0x1

    :goto_f
    return v0
.end method
