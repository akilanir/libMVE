.class public Lcyanogenmod/app/CustomTile$ExpandedStyle;
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
    name = "ExpandedStyle"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcyanogenmod/app/CustomTile$ExpandedStyle;",
            ">;"
        }
    .end annotation
.end field

.field public static final GRID_STYLE:I = 0x0

.field public static final LIST_STYLE:I = 0x1

.field public static final NO_STYLE:I = -0x1


# instance fields
.field private expandedItems:[Lcyanogenmod/app/CustomTile$ExpandedItem;

.field private styleId:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 377
    new-instance v0, Lcyanogenmod/app/CustomTile$ExpandedStyle$1;

    invoke-direct {v0}, Lcyanogenmod/app/CustomTile$ExpandedStyle$1;-><init>()V

    sput-object v0, Lcyanogenmod/app/CustomTile$ExpandedStyle;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .prologue
    .line 260
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 261
    const/4 v0, -0x1

    iput v0, p0, Lcyanogenmod/app/CustomTile$ExpandedStyle;->styleId:I

    .line 262
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .registers 6
    .param p1, "parcel"    # Landroid/os/Parcel;

    .prologue
    .line 267
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 270
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 271
    .local v1, "parcelableVersion":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 272
    .local v0, "parcelableSize":I
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    .line 277
    .local v2, "startPosition":I
    const/4 v3, 0x1

    if-lt v1, v3, :cond_28

    .line 278
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_22

    .line 279
    sget-object v3, Lcyanogenmod/app/CustomTile$ExpandedItem;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->createTypedArray(Landroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lcyanogenmod/app/CustomTile$ExpandedItem;

    iput-object v3, p0, Lcyanogenmod/app/CustomTile$ExpandedStyle;->expandedItems:[Lcyanogenmod/app/CustomTile$ExpandedItem;

    .line 281
    :cond_22
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    iput v3, p0, Lcyanogenmod/app/CustomTile$ExpandedStyle;->styleId:I

    .line 284
    :cond_28
    add-int v3, v2, v0

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 285
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcyanogenmod/app/CustomTile$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcyanogenmod/app/CustomTile$1;

    .prologue
    .line 244
    invoke-direct {p0, p1}, Lcyanogenmod/app/CustomTile$ExpandedStyle;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method synthetic constructor <init>(Lcyanogenmod/app/CustomTile$1;)V
    .registers 2
    .param p1, "x0"    # Lcyanogenmod/app/CustomTile$1;

    .prologue
    .line 244
    invoke-direct {p0}, Lcyanogenmod/app/CustomTile$ExpandedStyle;-><init>()V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .prologue
    .line 329
    const/4 v0, 0x0

    return v0
.end method

.method public getExpandedItems()[Lcyanogenmod/app/CustomTile$ExpandedItem;
    .registers 2

    .prologue
    .line 316
    iget-object v0, p0, Lcyanogenmod/app/CustomTile$ExpandedStyle;->expandedItems:[Lcyanogenmod/app/CustomTile$ExpandedItem;

    return-object v0
.end method

.method public getStyle()I
    .registers 2

    .prologue
    .line 324
    iget v0, p0, Lcyanogenmod/app/CustomTile$ExpandedStyle;->styleId:I

    return v0
.end method

.method protected internalSetExpandedItems(Ljava/util/ArrayList;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<+",
            "Lcyanogenmod/app/CustomTile$ExpandedItem;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 300
    .local p1, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<+Lcyanogenmod/app/CustomTile$ExpandedItem;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Lcyanogenmod/app/CustomTile$ExpandedItem;

    iput-object v0, p0, Lcyanogenmod/app/CustomTile$ExpandedStyle;->expandedItems:[Lcyanogenmod/app/CustomTile$ExpandedItem;

    .line 301
    iget-object v0, p0, Lcyanogenmod/app/CustomTile$ExpandedStyle;->expandedItems:[Lcyanogenmod/app/CustomTile$ExpandedItem;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 302
    return-void
.end method

.method protected internalStyleId(I)V
    .registers 2
    .param p1, "id"    # I

    .prologue
    .line 308
    iput p1, p0, Lcyanogenmod/app/CustomTile$ExpandedStyle;->styleId:I

    .line 309
    return-void
.end method

.method public setBuilder(Lcyanogenmod/app/CustomTile$Builder;)V
    .registers 2
    .param p1, "builder"    # Lcyanogenmod/app/CustomTile$Builder;

    .prologue
    .line 291
    if-eqz p1, :cond_5

    .line 292
    invoke-virtual {p1, p0}, Lcyanogenmod/app/CustomTile$Builder;->setExpandedStyle(Lcyanogenmod/app/CustomTile$ExpandedStyle;)Lcyanogenmod/app/CustomTile$Builder;

    .line 294
    :cond_5
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 9

    .prologue
    .line 362
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 363
    .local v2, "b":Ljava/lang/StringBuilder;
    const-string v6, "line.separator"

    invoke-static {v6}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 364
    .local v0, "NEW_LINE":Ljava/lang/String;
    iget-object v6, p0, Lcyanogenmod/app/CustomTile$ExpandedStyle;->expandedItems:[Lcyanogenmod/app/CustomTile$ExpandedItem;

    if-eqz v6, :cond_4e

    .line 365
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "expandedItems= "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 366
    iget-object v1, p0, Lcyanogenmod/app/CustomTile$ExpandedStyle;->expandedItems:[Lcyanogenmod/app/CustomTile$ExpandedItem;

    .local v1, "arr$":[Lcyanogenmod/app/CustomTile$ExpandedItem;
    array-length v5, v1

    .local v5, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_29
    if-ge v3, v5, :cond_4e

    aget-object v4, v1, v3

    .line 367
    .local v4, "item":Lcyanogenmod/app/CustomTile$ExpandedItem;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "     item="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v4}, Lcyanogenmod/app/CustomTile$ExpandedItem;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 366
    add-int/lit8 v3, v3, 0x1

    goto :goto_29

    .line 370
    .end local v1    # "arr$":[Lcyanogenmod/app/CustomTile$ExpandedItem;
    .end local v3    # "i$":I
    .end local v4    # "item":Lcyanogenmod/app/CustomTile$ExpandedItem;
    .end local v5    # "len$":I
    :cond_4e
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "styleId="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, p0, Lcyanogenmod/app/CustomTile$ExpandedStyle;->styleId:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 371
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 9
    .param p1, "parcel"    # Landroid/os/Parcel;
    .param p2, "i"    # I

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 336
    invoke-virtual {p1, v5}, Landroid/os/Parcel;->writeInt(I)V

    .line 340
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v1

    .line 341
    .local v1, "sizePosition":I
    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 342
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    .line 345
    .local v2, "startPosition":I
    iget-object v3, p0, Lcyanogenmod/app/CustomTile$ExpandedStyle;->expandedItems:[Lcyanogenmod/app/CustomTile$ExpandedItem;

    if-eqz v3, :cond_33

    .line 346
    invoke-virtual {p1, v5}, Landroid/os/Parcel;->writeInt(I)V

    .line 347
    iget-object v3, p0, Lcyanogenmod/app/CustomTile$ExpandedStyle;->expandedItems:[Lcyanogenmod/app/CustomTile$ExpandedItem;

    invoke-virtual {p1, v3, v4}, Landroid/os/Parcel;->writeTypedArray([Landroid/os/Parcelable;I)V

    .line 351
    :goto_1c
    iget v3, p0, Lcyanogenmod/app/CustomTile$ExpandedStyle;->styleId:I

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 354
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v3

    sub-int v0, v3, v2

    .line 355
    .local v0, "parcelableSize":I
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 356
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 357
    add-int v3, v2, v0

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 358
    return-void

    .line 349
    .end local v0    # "parcelableSize":I
    :cond_33
    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_1c
.end method
