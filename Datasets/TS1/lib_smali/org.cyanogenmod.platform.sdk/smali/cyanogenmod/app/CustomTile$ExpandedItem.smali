.class public Lcyanogenmod/app/CustomTile$ExpandedItem;
.super Ljava/lang/Object;
.source "CustomTile.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcyanogenmod/app/CustomTile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ExpandedItem"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcyanogenmod/app/CustomTile$ExpandedItem;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public itemDrawableResourceId:I

.field public itemSummary:Ljava/lang/String;

.field public itemTitle:Ljava/lang/String;

.field public onClickPendingIntent:Landroid/app/PendingIntent;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 583
    new-instance v0, Lcyanogenmod/app/CustomTile$ExpandedItem$1;

    invoke-direct {v0}, Lcyanogenmod/app/CustomTile$ExpandedItem$1;-><init>()V

    sput-object v0, Lcyanogenmod/app/CustomTile$ExpandedItem;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .prologue
    .line 461
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 459
    const/4 v0, 0x0

    iput-object v0, p0, Lcyanogenmod/app/CustomTile$ExpandedItem;->itemSummary:Ljava/lang/String;

    .line 463
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .registers 6
    .param p1, "parcel"    # Landroid/os/Parcel;

    .prologue
    .line 496
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 459
    const/4 v3, 0x0

    iput-object v3, p0, Lcyanogenmod/app/CustomTile$ExpandedItem;->itemSummary:Ljava/lang/String;

    .line 499
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 500
    .local v1, "parcelableVersion":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 501
    .local v0, "parcelableSize":I
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    .line 506
    .local v2, "startPosition":I
    const/4 v3, 0x1

    if-lt v1, v3, :cond_43

    .line 507
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_25

    .line 508
    sget-object v3, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/PendingIntent;

    iput-object v3, p0, Lcyanogenmod/app/CustomTile$ExpandedItem;->onClickPendingIntent:Landroid/app/PendingIntent;

    .line 510
    :cond_25
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_31

    .line 511
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcyanogenmod/app/CustomTile$ExpandedItem;->itemTitle:Ljava/lang/String;

    .line 513
    :cond_31
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_3d

    .line 514
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcyanogenmod/app/CustomTile$ExpandedItem;->itemSummary:Ljava/lang/String;

    .line 516
    :cond_3d
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    iput v3, p0, Lcyanogenmod/app/CustomTile$ExpandedItem;->itemDrawableResourceId:I

    .line 519
    :cond_43
    add-int v3, v2, v0

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 520
    return-void
.end method

.method synthetic constructor <init>(Lcyanogenmod/app/CustomTile$1;)V
    .registers 2
    .param p1, "x0"    # Lcyanogenmod/app/CustomTile$1;

    .prologue
    .line 438
    invoke-direct {p0}, Lcyanogenmod/app/CustomTile$ExpandedItem;-><init>()V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .prologue
    .line 524
    const/4 v0, 0x0

    return v0
.end method

.method protected internalSetItemDrawable(I)V
    .registers 2
    .param p1, "resourceId"    # I

    .prologue
    .line 469
    iput p1, p0, Lcyanogenmod/app/CustomTile$ExpandedItem;->itemDrawableResourceId:I

    .line 470
    return-void
.end method

.method protected internalSetItemSummary(Ljava/lang/String;)V
    .registers 2
    .param p1, "resourceId"    # Ljava/lang/String;

    .prologue
    .line 476
    iput-object p1, p0, Lcyanogenmod/app/CustomTile$ExpandedItem;->itemSummary:Ljava/lang/String;

    .line 477
    return-void
.end method

.method protected internalSetItemTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 483
    iput-object p1, p0, Lcyanogenmod/app/CustomTile$ExpandedItem;->itemTitle:Ljava/lang/String;

    .line 484
    return-void
.end method

.method protected internalSetOnClickPendingIntent(Landroid/app/PendingIntent;)V
    .registers 2
    .param p1, "pendingIntent"    # Landroid/app/PendingIntent;

    .prologue
    .line 490
    iput-object p1, p0, Lcyanogenmod/app/CustomTile$ExpandedItem;->onClickPendingIntent:Landroid/app/PendingIntent;

    .line 491
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 568
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 569
    .local v1, "b":Ljava/lang/StringBuilder;
    const-string v2, "line.separator"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 570
    .local v0, "NEW_LINE":Ljava/lang/String;
    iget-object v2, p0, Lcyanogenmod/app/CustomTile$ExpandedItem;->onClickPendingIntent:Landroid/app/PendingIntent;

    if-eqz v2, :cond_2f

    .line 571
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onClickPendingIntent= "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcyanogenmod/app/CustomTile$ExpandedItem;->onClickPendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {v3}, Landroid/app/PendingIntent;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 573
    :cond_2f
    iget-object v2, p0, Lcyanogenmod/app/CustomTile$ExpandedItem;->itemTitle:Ljava/lang/String;

    if-eqz v2, :cond_53

    .line 574
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "itemTitle= "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcyanogenmod/app/CustomTile$ExpandedItem;->itemTitle:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 576
    :cond_53
    iget-object v2, p0, Lcyanogenmod/app/CustomTile$ExpandedItem;->itemSummary:Ljava/lang/String;

    if-eqz v2, :cond_77

    .line 577
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "itemSummary= "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcyanogenmod/app/CustomTile$ExpandedItem;->itemSummary:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 579
    :cond_77
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "itemDrawableResourceId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcyanogenmod/app/CustomTile$ExpandedItem;->itemDrawableResourceId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 580
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 9
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 531
    invoke-virtual {p1, v5}, Landroid/os/Parcel;->writeInt(I)V

    .line 535
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v1

    .line 536
    .local v1, "sizePosition":I
    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 537
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    .line 539
    .local v2, "startPosition":I
    iget-object v3, p0, Lcyanogenmod/app/CustomTile$ExpandedItem;->onClickPendingIntent:Landroid/app/PendingIntent;

    if-eqz v3, :cond_53

    .line 540
    invoke-virtual {p1, v5}, Landroid/os/Parcel;->writeInt(I)V

    .line 541
    iget-object v3, p0, Lcyanogenmod/app/CustomTile$ExpandedItem;->onClickPendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {v3, p1, v4}, Landroid/app/PendingIntent;->writeToParcel(Landroid/os/Parcel;I)V

    .line 545
    :goto_1c
    iget-object v3, p0, Lcyanogenmod/app/CustomTile$ExpandedItem;->itemTitle:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_57

    .line 546
    invoke-virtual {p1, v5}, Landroid/os/Parcel;->writeInt(I)V

    .line 547
    iget-object v3, p0, Lcyanogenmod/app/CustomTile$ExpandedItem;->itemTitle:Ljava/lang/String;

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 551
    :goto_2c
    iget-object v3, p0, Lcyanogenmod/app/CustomTile$ExpandedItem;->itemSummary:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_5b

    .line 552
    invoke-virtual {p1, v5}, Landroid/os/Parcel;->writeInt(I)V

    .line 553
    iget-object v3, p0, Lcyanogenmod/app/CustomTile$ExpandedItem;->itemSummary:Ljava/lang/String;

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 557
    :goto_3c
    iget v3, p0, Lcyanogenmod/app/CustomTile$ExpandedItem;->itemDrawableResourceId:I

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 560
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v3

    sub-int v0, v3, v2

    .line 561
    .local v0, "parcelableSize":I
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 562
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 563
    add-int v3, v2, v0

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 564
    return-void

    .line 543
    .end local v0    # "parcelableSize":I
    :cond_53
    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_1c

    .line 549
    :cond_57
    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_2c

    .line 555
    :cond_5b
    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_3c
.end method
