.class public Lcyanogenmod/app/CustomTile$ExpandedGridItem;
.super Lcyanogenmod/app/CustomTile$ExpandedItem;
.source "CustomTile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcyanogenmod/app/CustomTile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ExpandedGridItem"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 604
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcyanogenmod/app/CustomTile$ExpandedItem;-><init>(Lcyanogenmod/app/CustomTile$1;)V

    .line 605
    return-void
.end method


# virtual methods
.method public setExpandedGridItemDrawable(I)V
    .registers 2
    .param p1, "resourceId"    # I

    .prologue
    .line 628
    invoke-virtual {p0, p1}, Lcyanogenmod/app/CustomTile$ExpandedGridItem;->internalSetItemDrawable(I)V

    .line 629
    return-void
.end method

.method public setExpandedGridItemOnClickIntent(Landroid/app/PendingIntent;)V
    .registers 2
    .param p1, "intent"    # Landroid/app/PendingIntent;

    .prologue
    .line 620
    invoke-virtual {p0, p1}, Lcyanogenmod/app/CustomTile$ExpandedGridItem;->internalSetOnClickPendingIntent(Landroid/app/PendingIntent;)V

    .line 621
    return-void
.end method

.method public setExpandedGridItemTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 612
    invoke-virtual {p0, p1}, Lcyanogenmod/app/CustomTile$ExpandedGridItem;->internalSetItemTitle(Ljava/lang/String;)V

    .line 613
    return-void
.end method
