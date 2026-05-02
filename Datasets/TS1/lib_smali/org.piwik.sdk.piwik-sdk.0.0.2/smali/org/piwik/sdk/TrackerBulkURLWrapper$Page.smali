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
    .param p2, "pageNumber"    # I

    .prologue
    .line 125
    iput-object p1, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->this$0:Lorg/piwik/sdk/TrackerBulkURLWrapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 126
    if-gez p2, :cond_13

    # getter for: Lorg/piwik/sdk/TrackerBulkURLWrapper;->mPages:I
    invoke-static {p1}, Lorg/piwik/sdk/TrackerBulkURLWrapper;->access$100(Lorg/piwik/sdk/TrackerBulkURLWrapper;)I

    move-result v0

    if-lt p2, v0, :cond_13

    .line 127
    const/4 v0, -0x1

    iput v0, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->toIndex:I

    iput v0, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->fromIndex:I

    .line 132
    :goto_12
    return-void

    .line 130
    :cond_13
    mul-int/lit8 v0, p2, 0x14

    iput v0, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->fromIndex:I

    .line 131
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

    goto :goto_12
.end method


# virtual methods
.method public elementsCount()I
    .registers 3

    .prologue
    .line 135
    iget v0, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->toIndex:I

    iget v1, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->fromIndex:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public isEmpty()Z
    .registers 3

    .prologue
    .line 139
    iget v0, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->fromIndex:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_b

    invoke-virtual {p0}, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->elementsCount()I

    move-result v0

    if-nez v0, :cond_d

    :cond_b
    const/4 v0, 0x1

    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method
