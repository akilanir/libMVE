.class public Lcyanogenmod/app/CustomTile$ExpandedListItem;
.super Lcyanogenmod/app/CustomTile$ExpandedItem;
.source "CustomTile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcyanogenmod/app/CustomTile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ExpandedListItem"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 639
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcyanogenmod/app/CustomTile$ExpandedItem;-><init>(Lcyanogenmod/app/CustomTile$1;)V

    .line 640
    return-void
.end method


# virtual methods
.method public setExpandedListItemDrawable(I)V
    .registers 2
    .param p1, "resourceId"    # I

    .prologue
    .line 671
    invoke-virtual {p0, p1}, Lcyanogenmod/app/CustomTile$ExpandedListItem;->internalSetItemDrawable(I)V

    .line 672
    return-void
.end method

.method public setExpandedListItemOnClickIntent(Landroid/app/PendingIntent;)V
    .registers 2
    .param p1, "intent"    # Landroid/app/PendingIntent;

    .prologue
    .line 663
    invoke-virtual {p0, p1}, Lcyanogenmod/app/CustomTile$ExpandedListItem;->internalSetOnClickPendingIntent(Landroid/app/PendingIntent;)V

    .line 664
    return-void
.end method

.method public setExpandedListItemSummary(Ljava/lang/String;)V
    .registers 2
    .param p1, "summary"    # Ljava/lang/String;

    .prologue
    .line 655
    invoke-virtual {p0, p1}, Lcyanogenmod/app/CustomTile$ExpandedListItem;->internalSetItemSummary(Ljava/lang/String;)V

    .line 656
    return-void
.end method

.method public setExpandedListItemTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 647
    invoke-virtual {p0, p1}, Lcyanogenmod/app/CustomTile$ExpandedListItem;->internalSetItemTitle(Ljava/lang/String;)V

    .line 648
    return-void
.end method
